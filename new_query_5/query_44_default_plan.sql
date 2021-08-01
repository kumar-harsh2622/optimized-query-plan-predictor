
SELECT MIN(t.title) AS movie_title
FROM imdb.dbo.company_name AS cn,
     imdb.dbo.keyword AS k,
     imdb.dbo.movie_companies AS mc,
     imdb.dbo.movie_keyword AS mk,
     imdb.dbo.title AS t
WHERE cn.country_code ='[om]'
  AND k.keyword ='character-name-in-title'
  AND cn.id = mc.company_id
  AND mc.movie_id = t.id
  AND t.id = mk.movie_id
  AND mk.keyword_id = k.id
  AND mc.movie_id = mk.movie_id
OPTION( MAXDOP 1,USE PLAN N'<?xml version="1.0" encoding="utf-16"?>
<ShowPlanXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" Version="1.539" Build="15.0.2000.5" xmlns="http://schemas.microsoft.com/sqlserver/2004/07/showplan">
  <BatchSequence>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="1" StatementEstRows="1" StatementId="1" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="TimeOut" CardinalityEstimationModelVersion="150" StatementSubTreeCost="3.59285" StatementText="&#xD;&#xA;SELECT MIN(t.title) AS movie_title&#xD;&#xA;FROM imdb.dbo.company_name AS cn,&#xD;&#xA;     imdb.dbo.keyword AS k,&#xD;&#xA;     imdb.dbo.movie_companies AS mc,&#xD;&#xA;     imdb.dbo.movie_keyword AS mk,&#xD;&#xA;     imdb.dbo.title AS t&#xD;&#xA;WHERE cn.country_code =''[om]''&#xD;&#xA;  AND k.keyword =''character-name-in-title''&#xD;&#xA;  AND cn.id = mc.company_id&#xD;&#xA;  AND mc.movie_id = t.id&#xD;&#xA;  AND t.id = mk.movie_id&#xD;&#xA;  AND mk.keyword_id = k.id&#xD;&#xA;  AND mc.movie_id = mk.movie_id" StatementType="SELECT" QueryHash="0x1ED368BF3E460FBE" QueryPlanHash="0x6929A247A4B9AE17" RetrievedFromCache="false" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan NonParallelPlanReason="NoParallelPlansInDesktopOrExpressEdition" CachedPlanSize="152" CompileTime="18" CompileCPU="18" CompileMemory="1624">
            <MissingIndexes>
              <MissingIndexGroup Impact="19.2337">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[movie_companies]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[company_id]" ColumnId="3" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[movie_id]" ColumnId="2" />
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
              <MissingIndexGroup Impact="29.1997">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[movie_id]" ColumnId="2" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[keyword_id]" ColumnId="3" />
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
              <MissingIndexGroup Impact="46.3447">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[title]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[id]" ColumnId="1" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[title]" ColumnId="2" />
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
            </MissingIndexes>
            <MemoryGrantInfo SerialRequiredMemory="4096" SerialDesiredMemory="4224" GrantedMemory="0" MaxUsedMemory="0" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="103769" EstimatedPagesCached="51884" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="1923576" />
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_name]" Statistics="[_WA_Sys_00000001_2C3393D0]" ModificationCount="0" SamplingPercent="63.4204" LastUpdate="2021-06-15T23:44:40.13" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[_WA_Sys_00000003_398D8EEE]" ModificationCount="0" SamplingPercent="10.1063" LastUpdate="2021-06-15T22:51:17.29" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[title]" Statistics="[_WA_Sys_00000001_44FF419A]" ModificationCount="0" SamplingPercent="8.75228" LastUpdate="2021-06-15T23:44:40.63" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_name]" Statistics="[_WA_Sys_00000003_2C3393D0]" ModificationCount="0" SamplingPercent="43.1299" LastUpdate="2021-06-15T22:51:13.81" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[keyword]" Statistics="[_WA_Sys_00000002_33D4B598]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-16T21:54:13.32" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[_WA_Sys_00000002_398D8EEE]" ModificationCount="0" SamplingPercent="10.1063" LastUpdate="2021-06-15T22:51:17" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[keyword]" Statistics="[_WA_Sys_00000001_33D4B598]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-16T21:54:13.55" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Statistics="[_WA_Sys_00000003_3D5E1FD2]" ModificationCount="0" SamplingPercent="29.1222" LastUpdate="2021-06-16T21:54:16.31" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Statistics="[_WA_Sys_00000002_3D5E1FD2]" ModificationCount="0" SamplingPercent="29.1222" LastUpdate="2021-06-16T21:54:15" />
            </OptimizerStatsUsage>
            <TraceFlags IsCompileTime="true">
              <TraceFlag Value="8017" Scope="Global" />
            </TraceFlags>
            <RelOp AvgRowSize="186" EstimateCPU="1.1E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="0" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="3.59285">
              <OutputList>
                <ColumnReference Column="Expr1010" />
              </OutputList>
              <StreamAggregate>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1010" />
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
                <RelOp AvgRowSize="186" EstimateCPU="0.00177651" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Inner Join" NodeId="1" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="3.59285">
                  <OutputList>
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                  </OutputList>
                  <MemoryFractions Input="1" Output="1" />
                  <Hash BitmapCreator="true">
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="Opt_Bitmap1066" />
                      </DefinedValue>
                    </DefinedValues>
                    <HashKeysBuild>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="id" />
                    </HashKeysBuild>
                    <HashKeysProbe>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                    </HashKeysProbe>
                    <RelOp AvgRowSize="11" EstimateCPU="0.00644016" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Filter" NodeId="2" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.116191">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="id" />
                      </OutputList>
                      <Filter StartupExpression="false">
                        <RelOp AvgRowSize="30" EstimateCPU="0.0147744" EstimateIO="0.0949769" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="134170" EstimatedRowsRead="134170" LogicalOp="Clustered Index Scan" NodeId="3" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.109751" TableCardinality="134170">
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
                          <ScalarOperator ScalarString="[imdb].[dbo].[keyword].[keyword] as [k].[keyword]=''character-name-in-title''">
                            <Compare CompareOp="EQ">
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[keyword]" Alias="[k]" Column="keyword" />
                                </Identifier>
                              </ScalarOperator>
                              <ScalarOperator>
                                <Const ConstValue="''character-name-in-title''" />
                              </ScalarOperator>
                            </Compare>
                          </ScalarOperator>
                        </Predicate>
                      </Filter>
                    </RelOp>
                    <RelOp AvgRowSize="190" EstimateCPU="0.0017767" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Inner Join" NodeId="4" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="3.47488">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                      </OutputList>
                      <MemoryFractions Input="0.75" Output="0.75" />
                      <Hash BitmapCreator="true">
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Column="Opt_Bitmap1067" />
                          </DefinedValue>
                        </DefinedValues>
                        <HashKeysBuild>
                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="movie_id" />
                        </HashKeysBuild>
                        <HashKeysProbe>
                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                        </HashKeysProbe>
                        <RelOp AvgRowSize="15" EstimateCPU="0.00181922" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Inner Join" NodeId="5" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="1.80592">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="movie_id" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="keyword_id" />
                          </OutputList>
                          <MemoryFractions Input="0.5" Output="0.5" />
                          <Hash BitmapCreator="true">
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Column="Opt_Bitmap1068" />
                              </DefinedValue>
                            </DefinedValues>
                            <HashKeysBuild>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                            </HashKeysBuild>
                            <HashKeysProbe>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_keyword]" Alias="[mk]" Column="movie_id" />
                            </HashKeysProbe>
                            <RelOp AvgRowSize="11" EstimateCPU="0.00179167" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="44.8054" LogicalOp="Inner Join" NodeId="6" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="0.752951">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                              </OutputList>
                              <MemoryFractions Input="0.25" Output="0.25" />
                              <Hash BitmapCreator="true">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Column="Opt_Bitmap1022" />
                                  </DefinedValue>
                                </DefinedValues>
                                <HashKeysBuild>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id" />
                                </HashKeysBuild>
                                <HashKeysProbe>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                </HashKeysProbe>
                                <RelOp AvgRowSize="11" EstimateCPU="0.0112799" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Filter" NodeId="7" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.058048">
                                  <OutputList>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id" />
                                  </OutputList>
                                  <Filter StartupExpression="false">
                                    <RelOp AvgRowSize="18" EstimateCPU="0.0258654" EstimateIO="0.0209028" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="234997" EstimatedRowsRead="234997" LogicalOp="Clustered Index Scan" NodeId="8" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.0467681" TableCardinality="234997">
                                      <OutputList>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code" />
                                      </OutputList>
                                      <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id" />
                                          </DefinedValue>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code" />
                                          </DefinedValue>
                                        </DefinedValues>
                                        <Object Database="[imdb]" Schema="[dbo]" Table="[company_name]" Index="[CCI_company_name]" Alias="[cn]" IndexKind="Clustered" Storage="ColumnStore" />
                                      </IndexScan>
                                    </RelOp>
                                    <Predicate>
                                      <ScalarOperator ScalarString="[imdb].[dbo].[company_name].[country_code] as [cn].[country_code]=''[om]''">
                                        <Compare CompareOp="EQ">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="''[om]''" />
                                          </ScalarOperator>
                                        </Compare>
                                      </ScalarOperator>
                                    </Predicate>
                                  </Filter>
                                </RelOp>
                                <RelOp AvgRowSize="15" EstimateCPU="0.28702" EstimateIO="0.406088" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="26.0913" EstimatedRowsRead="26.0913" LogicalOp="Clustered Index Scan" NodeId="10" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.693108" TableCardinality="2609130">
                                  <OutputList>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                  </OutputList>
                                  <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                      </DefinedValue>
                                      <DefinedValue>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                      </DefinedValue>
                                    </DefinedValues>
                                    <Object Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Index="[CCI_movie_companies]" Alias="[mc]" IndexKind="Clustered" Storage="ColumnStore" />
                                    <Predicate>
                                      <ScalarOperator ScalarString="PROBE([Opt_Bitmap1022],[imdb].[dbo].[movie_companies].[company_id] as [mc].[company_id])">
                                        <Intrinsic FunctionName="PROBE">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Column="Opt_Bitmap1022" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                            </Identifier>
                                          </ScalarOperator>
                                        </Intrinsic>
                                      </ScalarOperator>
                                    </Predicate>
                                  </IndexScan>
                                </RelOp>
                              </Hash>
                            </RelOp>
                            <RelOp AvgRowSize="15" EstimateCPU="0.497648" EstimateIO="0.553495" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Clustered Index Scan" NodeId="12" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="1.05114" TableCardinality="4523930">
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
                                  <ScalarOperator ScalarString="PROBE([Opt_Bitmap1066],[imdb].[dbo].[movie_keyword].[keyword_id] as [mk].[keyword_id]) AND PROBE([Opt_Bitmap1068],[imdb].[dbo].[movie_keyword].[movie_id] as [mk].[movie_id])">
                                    <Logical Operation="AND">
                                      <ScalarOperator>
                                        <Intrinsic FunctionName="PROBE">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Column="Opt_Bitmap1066" />
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
                                              <ColumnReference Column="Opt_Bitmap1068" />
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
                        <RelOp AvgRowSize="190" EstimateCPU="0.27813" EstimateIO="1.38905" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Clustered Index Scan" NodeId="14" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="1.66718" TableCardinality="2528310">
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
                              <ScalarOperator ScalarString="PROBE([Opt_Bitmap1067],[imdb].[dbo].[title].[id] as [t].[id])">
                                <Intrinsic FunctionName="PROBE">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Column="Opt_Bitmap1067" />
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                    </Identifier>
                                  </ScalarOperator>
                                </Intrinsic>
                              </ScalarOperator>
                            </Predicate>
                          </IndexScan>
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