
SELECT MIN(mi_idx.info) AS info,
       MIN(t.title) AS movie_title
FROM imdb.dbo.info_type AS it,
     imdb.dbo.keyword AS k,
     imdb.dbo.movie_info_idx AS mi_idx,
     imdb.dbo.movie_keyword AS mk,
     imdb.dbo.title AS t
WHERE it.info ='rating'
  AND k.keyword LIKE '%sequel%'
  AND mi_idx.info > '467.3'
  AND t.production_year > 1895
  AND t.id = mi_idx.movie_id
  AND t.id = mk.movie_id
  AND mk.movie_id = mi_idx.movie_id
  AND k.id = mk.keyword_id
  AND it.id = mi_idx.info_type_id
OPTION( MAXDOP 1,USE PLAN N'<?xml version="1.0" encoding="utf-16"?>
<ShowPlanXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" Version="1.539" Build="15.0.2000.5" xmlns="http://schemas.microsoft.com/sqlserver/2004/07/showplan">
  <BatchSequence>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="1" StatementEstRows="1" StatementId="1" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="TimeOut" CardinalityEstimationModelVersion="150" StatementSubTreeCost="3.31727" StatementText="&#xD;&#xA;SELECT MIN(mi_idx.info) AS info,&#xD;&#xA;       MIN(t.title) AS movie_title&#xD;&#xA;FROM imdb.dbo.info_type AS it,&#xD;&#xA;     imdb.dbo.keyword AS k,&#xD;&#xA;     imdb.dbo.movie_info_idx AS mi_idx,&#xD;&#xA;     imdb.dbo.movie_keyword AS mk,&#xD;&#xA;     imdb.dbo.title AS t&#xD;&#xA;WHERE it.info =''rating''&#xD;&#xA;  AND k.keyword LIKE ''%sequel%''&#xD;&#xA;  AND mi_idx.info &gt; ''467.3''&#xD;&#xA;  AND t.production_year &gt; 1895&#xD;&#xA;  AND t.id = mi_idx.movie_id&#xD;&#xA;  AND t.id = mk.movie_id&#xD;&#xA;  AND mk.movie_id = mi_idx.movie_id&#xD;&#xA;  AND k.id = mk.keyword_id&#xD;&#xA;  AND it.id = mi_idx.info_type_id" StatementType="SELECT" QueryHash="0x113190FBB5831A6D" QueryPlanHash="0x542E8E40EA02B371" RetrievedFromCache="false" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan NonParallelPlanReason="NoParallelPlansInDesktopOrExpressEdition" CachedPlanSize="160" CompileTime="24" CompileCPU="24" CompileMemory="1944">
            <MissingIndexes>
              <MissingIndexGroup Impact="34.2196">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[movie_id]" ColumnId="2" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[keyword_id]" ColumnId="3" />
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
              <MissingIndexGroup Impact="50.6663">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[title]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[id]" ColumnId="1" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INEQUALITY">
                    <Column Name="[production_year]" ColumnId="5" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[title]" ColumnId="2" />
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
            </MissingIndexes>
            <MemoryGrantInfo SerialRequiredMemory="4096" SerialDesiredMemory="9128" GrantedMemory="0" MaxUsedMemory="0" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="103769" EstimatedPagesCached="51884" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="2352296" />
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[title]" Statistics="[_WA_Sys_00000005_44FF419A]" ModificationCount="0" SamplingPercent="5.26414" LastUpdate="2021-06-15T22:51:18.04" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[info_type]" Statistics="[_WA_Sys_00000001_31EC6D26]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T00:18:57.51" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Statistics="[_WA_Sys_00000002_3B75D760]" ModificationCount="0" SamplingPercent="82.7381" LastUpdate="2021-06-17T00:18:59.08" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[info_type]" Statistics="[_WA_Sys_00000002_31EC6D26]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T00:18:55.53" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[title]" Statistics="[_WA_Sys_00000001_44FF419A]" ModificationCount="0" SamplingPercent="8.75228" LastUpdate="2021-06-15T23:44:40.63" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[keyword]" Statistics="[_WA_Sys_00000002_33D4B598]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-16T21:54:13.32" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[keyword]" Statistics="[_WA_Sys_00000001_33D4B598]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-16T21:54:13.55" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Statistics="[_WA_Sys_00000004_3B75D760]" ModificationCount="0" SamplingPercent="82.7381" LastUpdate="2021-06-17T00:18:57.19" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Statistics="[_WA_Sys_00000003_3D5E1FD2]" ModificationCount="0" SamplingPercent="29.1222" LastUpdate="2021-06-16T21:54:16.31" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Statistics="[_WA_Sys_00000003_3B75D760]" ModificationCount="0" SamplingPercent="82.7381" LastUpdate="2021-06-17T00:18:58.14" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Statistics="[_WA_Sys_00000002_3D5E1FD2]" ModificationCount="0" SamplingPercent="29.1222" LastUpdate="2021-06-16T21:54:15" />
            </OptimizerStatsUsage>
            <TraceFlags IsCompileTime="true">
              <TraceFlag Value="8017" Scope="Global" />
            </TraceFlags>
            <RelOp AvgRowSize="193" EstimateCPU="1.98354E-05" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="0" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="3.31727">
              <OutputList>
                <ColumnReference Column="Expr1010" />
                <ColumnReference Column="Expr1011" />
              </OutputList>
              <StreamAggregate>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1010" />
                    <ScalarOperator ScalarString="MIN([imdb].[dbo].[movie_info_idx].[info] as [mi_idx].[info])">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info" />
                          </Identifier>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                  <DefinedValue>
                    <ColumnReference Column="Expr1011" />
                    <ScalarOperator ScalarString="MIN([imdb].[dbo].[title].[title] as [t].[title])">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                          </Identifier>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="193" EstimateCPU="0.00182411" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="32.2256" LogicalOp="Inner Join" NodeId="1" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="3.31725">
                  <OutputList>
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info" />
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                  </OutputList>
                  <MemoryFractions Input="1" Output="1" />
                  <Hash BitmapCreator="true">
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="Opt_Bitmap1052" />
                      </DefinedValue>
                    </DefinedValues>
                    <HashKeysBuild>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="id" />
                    </HashKeysBuild>
                    <HashKeysProbe>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                    </HashKeysProbe>
                    <RelOp AvgRowSize="11" EstimateCPU="0.011807" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="2.78477" LogicalOp="Filter" NodeId="2" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.121558">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="id" />
                      </OutputList>
                      <Filter StartupExpression="false">
                        <RelOp AvgRowSize="65" EstimateCPU="0.0147744" EstimateIO="0.0949769" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="134170" EstimatedRowsRead="134170" LogicalOp="Clustered Index Scan" NodeId="3" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.109751" TableCardinality="134170">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="id" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="keyword" />
                          </OutputList>
                          <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="id" />
                              </DefinedValue>
                              <DefinedValue>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="keyword" />
                              </DefinedValue>
                            </DefinedValues>
                            <Object Database="[imdb]" Schema="[dbo]" Table="[keyword]" Index="[CCI_keyword]" Alias="[k]" IndexKind="Clustered" Storage="ColumnStore" />
                          </IndexScan>
                        </RelOp>
                        <Predicate>
                          <ScalarOperator ScalarString="[imdb].[dbo].[keyword].[keyword] as [k].[keyword] like ''%sequel%''">
                            <Intrinsic FunctionName="like">
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="keyword" />
                                </Identifier>
                              </ScalarOperator>
                              <ScalarOperator>
                                <Const ConstValue="''%sequel%''" />
                              </ScalarOperator>
                            </Intrinsic>
                          </ScalarOperator>
                        </Predicate>
                      </Filter>
                    </RelOp>
                    <RelOp AvgRowSize="197" EstimateCPU="0.00180613" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="96.0112" LogicalOp="Inner Join" NodeId="4" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="3.19387">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info" />
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                      </OutputList>
                      <MemoryFractions Input="0.993641" Output="0.993641" />
                      <Hash BitmapCreator="true">
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Column="Opt_Bitmap1035" />
                          </DefinedValue>
                        </DefinedValues>
                        <HashKeysBuild>
                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="id" />
                        </HashKeysBuild>
                        <HashKeysProbe>
                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info_type_id" />
                        </HashKeysProbe>
                        <RelOp AvgRowSize="11" EstimateCPU="5.424E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Filter" NodeId="5" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.00315855">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="id" />
                          </OutputList>
                          <Filter StartupExpression="false">
                            <RelOp AvgRowSize="28" EstimateCPU="2.813E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="113" EstimatedRowsRead="113" LogicalOp="Clustered Index Scan" NodeId="6" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00315313" TableCardinality="113">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="id" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="info" />
                              </OutputList>
                              <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="id" />
                                  </DefinedValue>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="info" />
                                  </DefinedValue>
                                </DefinedValues>
                                <Object Database="[imdb]" Schema="[dbo]" Table="[info_type]" Index="[CCI_info_type]" Alias="[it]" IndexKind="Clustered" Storage="ColumnStore" />
                              </IndexScan>
                            </RelOp>
                            <Predicate>
                              <ScalarOperator ScalarString="[imdb].[dbo].[info_type].[info] as [it].[info]=''rating''">
                                <Compare CompareOp="EQ">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="info" />
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Const ConstValue="''rating''" />
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                            </Predicate>
                          </Filter>
                        </RelOp>
                        <RelOp AvgRowSize="201" EstimateCPU="0.00186553" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="48.0056" LogicalOp="Inner Join" NodeId="7" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="3.1889">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info_type_id" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                          </OutputList>
                          <MemoryFractions Input="0.987281" Output="0.987281" />
                          <Hash BitmapCreator="true">
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Column="Opt_Bitmap1039" />
                              </DefinedValue>
                            </DefinedValues>
                            <HashKeysBuild>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="movie_id" />
                            </HashKeysBuild>
                            <HashKeysProbe>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                            </HashKeysProbe>
                            <RelOp AvgRowSize="32" EstimateCPU="0.0878752" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="49.18" LogicalOp="Inner Join" NodeId="8" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="1.50429">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info_type_id" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="movie_id" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                              </OutputList>
                              <MemoryFractions Input="0.980922" Output="0.980922" />
                              <Hash BitmapCreator="true">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Column="Opt_Bitmap1022" />
                                  </DefinedValue>
                                </DefinedValues>
                                <HashKeysBuild>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="movie_id" />
                                </HashKeysBuild>
                                <HashKeysProbe>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="movie_id" />
                                </HashKeysProbe>
                                <RelOp AvgRowSize="24" EstimateCPU="0.00662417" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="55929.6" LogicalOp="Filter" NodeId="9" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.365272">
                                  <OutputList>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="movie_id" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info_type_id" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info" />
                                  </OutputList>
                                  <Filter StartupExpression="false">
                                    <RelOp AvgRowSize="24" EstimateCPU="0.15182" EstimateIO="0.206829" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="138004" EstimatedRowsRead="138004" LogicalOp="Clustered Index Scan" NodeId="10" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.358648" TableCardinality="1380040">
                                      <OutputList>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="movie_id" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info_type_id" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info" />
                                      </OutputList>
                                      <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="movie_id" />
                                          </DefinedValue>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info_type_id" />
                                          </DefinedValue>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info" />
                                          </DefinedValue>
                                        </DefinedValues>
                                        <Object Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Index="[CCI_movie_info_idx]" Alias="[mi_idx]" IndexKind="Clustered" Storage="ColumnStore" />
                                        <Predicate>
                                          <ScalarOperator ScalarString="PROBE([Opt_Bitmap1035],[imdb].[dbo].[movie_info_idx].[info_type_id] as [mi_idx].[info_type_id])">
                                            <Intrinsic FunctionName="PROBE">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="Opt_Bitmap1035" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info_type_id" />
                                                </Identifier>
                                              </ScalarOperator>
                                            </Intrinsic>
                                          </ScalarOperator>
                                        </Predicate>
                                      </IndexScan>
                                    </RelOp>
                                    <Predicate>
                                      <ScalarOperator ScalarString="[imdb].[dbo].[movie_info_idx].[info] as [mi_idx].[info]&gt;''467.3''">
                                        <Compare CompareOp="GT">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[mi_idx]" Column="info" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="''467.3''" />
                                          </ScalarOperator>
                                        </Compare>
                                      </ScalarOperator>
                                    </Predicate>
                                  </Filter>
                                </RelOp>
                                <RelOp AvgRowSize="15" EstimateCPU="0.497648" EstimateIO="0.553495" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="45.2393" EstimatedRowsRead="45.2393" LogicalOp="Clustered Index Scan" NodeId="12" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="1.05114" TableCardinality="4523930">
                                  <OutputList>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="movie_id" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                                  </OutputList>
                                  <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="movie_id" />
                                      </DefinedValue>
                                      <DefinedValue>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                                      </DefinedValue>
                                    </DefinedValues>
                                    <Object Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Index="[CCI_movie_keyword]" Alias="[mk]" IndexKind="Clustered" Storage="ColumnStore" />
                                    <Predicate>
                                      <ScalarOperator ScalarString="PROBE([Opt_Bitmap1052],[imdb].[dbo].[movie_keyword].[keyword_id] as [mk].[keyword_id]) AND PROBE([Opt_Bitmap1022],[imdb].[dbo].[movie_keyword].[movie_id] as [mk].[movie_id])">
                                        <Logical Operation="AND">
                                          <ScalarOperator>
                                            <Intrinsic FunctionName="PROBE">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="Opt_Bitmap1052" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                                                </Identifier>
                                              </ScalarOperator>
                                            </Intrinsic>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Intrinsic FunctionName="PROBE">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="Opt_Bitmap1022" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="movie_id" />
                                                </Identifier>
                                              </ScalarOperator>
                                            </Intrinsic>
                                          </ScalarOperator>
                                        </Logical>
                                      </ScalarOperator>
                                    </Predicate>
                                  </IndexScan>
                                </RelOp>
                              </Hash>
                            </RelOp>
                            <RelOp AvgRowSize="194" EstimateCPU="0.27813" EstimateIO="1.40461" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="2.4614" EstimatedRowsRead="2.52831" LogicalOp="Clustered Index Scan" NodeId="14" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="1.68274" TableCardinality="2528310">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                              </OutputList>
                              <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                  </DefinedValue>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                                  </DefinedValue>
                                </DefinedValues>
                                <Object Database="[imdb]" Schema="[dbo]" Table="[title]" Index="[CCI_title]" Alias="[t]" IndexKind="Clustered" Storage="ColumnStore" />
                                <Predicate>
                                  <ScalarOperator ScalarString="[imdb].[dbo].[title].[production_year] as [t].[production_year]&gt;(1895) AND PROBE([Opt_Bitmap1039],[imdb].[dbo].[title].[id] as [t].[id])">
                                    <Logical Operation="AND">
                                      <ScalarOperator>
                                        <Compare CompareOp="GT">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="production_year" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="(1895)" />
                                          </ScalarOperator>
                                        </Compare>
                                      </ScalarOperator>
                                      <ScalarOperator>
                                        <Intrinsic FunctionName="PROBE">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Column="Opt_Bitmap1039" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                            </Identifier>
                                          </ScalarOperator>
                                        </Intrinsic>
                                      </ScalarOperator>
                                    </Logical>
                                  </ScalarOperator>
                                </Predicate>
                              </IndexScan>
                            </RelOp>
                          </Hash>
                        </RelOp>
                      </Hash>
                    </RelOp>
                  </Hash>
                </RelOp>
              </StreamAggregate>
            </RelOp>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
  </BatchSequence>
</ShowPlanXML>')