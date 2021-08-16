from os import listdir, rename, remove, path, walk
from shutil import copy2, move
from csv import reader, writer
import pyodbc 
import win32file as win
from tqdm import tqdm
import platform as p
 
srcFilesLocation = path.normpath(r"G:\tpc-ds-tool\v3.1.0rc2\tools") 
srcCSVFilesLocation = path.normpath(r"G:\dbquery-optimizer\data\tpcds") 
tgtFilesLocation = path.normpath(r"G:\dbquery-optimizer\data\tpcds-data")    
delimiter = '|'
keepSrcFiles = True
keepSrcCSVFiles = True
rowLimit = 100000000
outputNameTemplate = '_%s.csv'
keepHeaders = False
             
def getSize(start_path):
    total_size = 0
    for dirpath, dirnames, filenames in walk(start_path):
        for f in filenames:
            fp = path.join(dirpath, f)
            total_size += path.getsize(fp)            
    return total_size 
 
def freeSpace(start_path):
    secsPerClus, bytesPerSec, nFreeClus, totClus = win.GetDiskFreeSpace(start_path)
    return secsPerClus * bytesPerSec * nFreeClus
 
def removeFiles(DirPath):
    filelist = [ f for f in listdir(DirPath)]
    for f in filelist:
        remove(path.join(DirPath, f))
 
def SplitAndMoveLargeFiles(file, rowCount, srcCSVFilesLocation, outputNameTemplate, keepHeaders=False):
    filehandler = open(path.join(srcCSVFilesLocation, file), 'r')
    csv_reader = reader(filehandler, delimiter=delimiter)
    current_piece = 1
    current_out_path = path.join(tgtFilesLocation, path.splitext(file)[0]+outputNameTemplate  % current_piece)
    current_out_writer = writer(open(current_out_path, 'w', newline=''), delimiter=delimiter)
    current_limit = rowLimit
    if keepHeaders:
        headers = next(csv_reader)
        current_out_writer.writerow(headers)
    pbar=tqdm(total=rowCount)        
    for i, row in enumerate(csv_reader):      
        pbar.update()             
        if i + 1 > current_limit:
            current_piece += 1
            current_limit = rowLimit * current_piece
            current_out_path = path.join(tgtFilesLocation, path.splitext(file)[0]+outputNameTemplate  % current_piece)
            current_out_writer = writer(open(current_out_path, 'w', newline=''), delimiter=delimiter)
            if keepHeaders:
                current_out_writer.writerow(headers)          
        current_out_writer.writerow(row)
    pbar.close()
 
def SourceFilesRename(srcFilesLocation, srcCSVFilesLocation):
    srcDirSize = getSize(srcFilesLocation)
    diskSize = freeSpace(srcFilesLocation)
    removeFiles(srcCSVFilesLocation)
    for file in listdir(srcFilesLocation):
        if file.endswith(".dat"):
            if keepSrcFiles:
                if srcDirSize >= diskSize:
                    print ('''Not enough space on the nominated disk to duplicate the files (you nominated to keep source files as they were generated i.e. with the .dat extension). 
                    Current source files directory size is {} MB. At least {} MB required to continue. Bailing out...'''
                    .format(round(srcDirSize/1024/1024,2), round(2*srcDirSize/1024/1024),2))
                    exit(1)
                else:                    
                    copy2(path.join(srcFilesLocation , file), srcCSVFilesLocation)
                    rename(path.join(srcCSVFilesLocation , file), path.join(srcCSVFilesLocation , file[:-4]+'.csv'))
            else:
                move(srcFilesLocation + file, srcCSVFilesLocation)
                rename(path.join(srcCSVFilesLocation , file), path.join(srcCSVFilesLocation , file[:-4]+'.csv'))
 
def ProcessLargeFiles(srcCSVFilesLocation,outputNameTemplate,rowLimit):
    fileRowCounts = []
    for file in listdir(srcCSVFilesLocation):
        if file.endswith(".csv"):
            fileRowCounts.append([file,sum(1 for line in open(path.join(srcCSVFilesLocation , file), newline=''))])               
    removeFiles(tgtFilesLocation)
    for file in fileRowCounts: 
        if file[1]>rowLimit:
            print("Processing File:", file[0],)
            print("Measured Row Count:", file[1])
            SplitAndMoveLargeFiles(file[0], file[1], srcCSVFilesLocation, outputNameTemplate)
        else:
            #print(path.join(srcCSVFilesLocation,file[0]))
            move(path.join(srcCSVFilesLocation, file[0]), tgtFilesLocation)
    removeFiles(srcCSVFilesLocation)            
 
if __name__ == "__main__":
    SourceFilesRename(srcFilesLocation, srcCSVFilesLocation)
    ProcessLargeFiles(srcCSVFilesLocation, outputNameTemplate, rowLimit)