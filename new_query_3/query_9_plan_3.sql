
SELECT MIN(cn.name) AS producing_company,
       MIN(miidx.info) AS rating,
       MIN(t.title) AS movie
FROM imdb.dbo.company_name AS cn,
     imdb.dbo.company_type AS ct,
     imdb.dbo.info_type AS it,
     imdb.dbo.info_type AS it2,
     imdb.dbo.kind_type AS kt,
     imdb.dbo.movie_companies AS mc,
     imdb.dbo.movie_info AS mi,
     imdb.dbo.movie_info_idx AS miidx,
     imdb.dbo.title AS t
WHERE cn.country_code ='[as]'
  AND ct.kind ='production companies'
  AND it.info ='plot'
  AND it2.info ='release dates'
  AND kt.kind ='tv series'
  AND mi.movie_id = t.id
  AND it2.id = mi.info_type_id
  AND kt.id = t.kind_id
  AND mc.movie_id = t.id
  AND cn.id = mc.company_id
  AND ct.id = mc.company_type_id
  AND miidx.movie_id = t.id
  AND it.id = miidx.info_type_id
  AND mi.movie_id = miidx.movie_id
  AND mi.movie_id = mc.movie_id
  AND miidx.movie_id = mc.movie_id
OPTION( MAXDOP 1, USE PLAN N'<ShowPlanXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/sqlserver/2004/07/showplan" Version="1.539" Build="15.0.2080.9">
  <BatchSequence>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="1" StatementEstRows="1" StatementId="1" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="TimeOut" CardinalityEstimationModelVersion="150" StatementSubTreeCost="6.32126" StatementText="&#13;&#10;SELECT MIN(cn.name) AS producing_company,&#13;&#10;       MIN(miidx.info) AS rating,&#13;&#10;       MIN(t.title) AS movie&#13;&#10;FROM imdb.dbo.company_name AS cn,&#13;&#10;     imdb.dbo.company_type AS ct,&#13;&#10;     imdb.dbo.info_type AS it,&#13;&#10;     imdb.dbo.info_type AS it2,&#13;&#10;     imdb.dbo.kind_type AS kt,&#13;&#10;     imdb.dbo.movie_companies AS mc,&#13;&#10;     imdb.dbo.movie_info AS mi,&#13;&#10;     imdb.dbo.movie_info_idx AS miidx,&#13;&#10;     imdb.dbo.title AS t&#13;&#10;WHERE cn.country_code =''[as]''&#13;&#10;  AND ct.kind =''production companies''&#13;&#10;  AND it.info =''plot''&#13;&#10;  AND it2.info =''release dates''&#13;&#10;  AND kt.kind =''tv series''&#13;&#10;  AND mi.movie_id = t.id&#13;&#10;  AND it2.id = mi.info_type_id&#13;&#10;  AND kt.id = t.kind_id&#13;&#10;  AND mc.movie_id = t.id&#13;&#10;  AND cn.id = mc.company_id&#13;&#10;  AND ct.id = mc.company_type_id&#13;&#10;  AND miidx.movie_id = t.id&#13;&#10;  AND it.id = miidx.info_type_id&#13;&#10;  AND mi.movie_id = miidx.movie_id&#13;&#10;  AND mi.movie_id = mc.movie_id&#13;&#10;  AND miidx.movie_id = mc.movie_id" StatementType="SELECT" QueryHash="0xBF1AA7EF32A8E09A" QueryPlanHash="0xB4A17D4B62CF9DDE" RetrievedFromCache="false" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true"/>
          <QueryPlan NonParallelPlanReason="MaxDOPSetToOne" CachedPlanSize="344" CompileTime="59" CompileCPU="59" CompileMemory="4376">
            <MissingIndexes>
              <MissingIndexGroup Impact="53.0956">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[movie_info]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[movie_id]" ColumnId="2"/>
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[info_type_id]" ColumnId="3"/>
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
              <MissingIndexGroup Impact="26.3463">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[title]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[id]" ColumnId="1"/>
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[title]" ColumnId="2"/>
                    <Column Name="[kind_id]" ColumnId="4"/>
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
            </MissingIndexes>
            <MemoryGrantInfo SerialRequiredMemory="8192" SerialDesiredMemory="8496" GrantedMemory="0" MaxUsedMemory="0"/>
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="103769" EstimatedPagesCached="51884" EstimatedAvailableDegreeOfParallelism="1" MaxCompileMemory="1057336"/>
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_type]" Statistics="[_WA_Sys_00000002_2E1BDC42]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T01:12:44.23"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[info_type]" Statistics="[_WA_Sys_00000001_31EC6D26]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T00:18:57.51"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Statistics="[_WA_Sys_00000002_3B75D760]" ModificationCount="0" SamplingPercent="82.7381" LastUpdate="2021-06-17T00:18:59.08"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Statistics="[_WA_Sys_00000002_46E78A0C]" ModificationCount="0" SamplingPercent="3.124" LastUpdate="2021-06-17T01:12:46.43"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[title]" Statistics="[_WA_Sys_00000004_44FF419A]" ModificationCount="0" SamplingPercent="8.75228" LastUpdate="2021-06-17T01:12:47.34"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_name]" Statistics="[_WA_Sys_00000001_2C3393D0]" ModificationCount="0" SamplingPercent="63.4204" LastUpdate="2021-06-15T23:44:40.13"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[info_type]" Statistics="[_WA_Sys_00000002_31EC6D26]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T00:18:55.53"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Statistics="[_WA_Sys_00000001_35BCFE0A]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T01:12:47.03"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_name]" Statistics="[company_name_country_code]" ModificationCount="0" SamplingPercent="63.4204" LastUpdate="2021-06-19T01:52:15.69"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[title]" Statistics="[_WA_Sys_00000001_44FF419A]" ModificationCount="0" SamplingPercent="8.75228" LastUpdate="2021-06-15T23:44:40.63"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[movie_companies_company_id]" ModificationCount="0" SamplingPercent="37.4542" LastUpdate="2021-06-19T02:03:52.37"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Statistics="[_WA_Sys_00000002_35BCFE0A]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T01:12:44.42"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Statistics="[_WA_Sys_00000003_46E78A0C]" ModificationCount="0" SamplingPercent="3.124" LastUpdate="2021-06-17T01:12:47.02"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[movie_companies_company_type_id]" ModificationCount="0" SamplingPercent="37.4542" LastUpdate="2021-06-19T02:06:42.68"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[movie_companies_movie_id]" ModificationCount="0" SamplingPercent="37.4542" LastUpdate="2021-06-19T02:03:51.47"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Statistics="[_WA_Sys_00000003_3B75D760]" ModificationCount="0" SamplingPercent="82.7381" LastUpdate="2021-06-17T00:18:58.14"/>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_type]" Statistics="[_WA_Sys_00000001_2E1BDC42]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-15T23:44:40.35"/>
            </OptimizerStatsUsage>
            <RelOp AvgRowSize="322" EstimateCPU="1.45753E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="0" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="6.32126">
              <OutputList>
                <ColumnReference Column="Expr1018"/>
                <ColumnReference Column="Expr1019"/>
                <ColumnReference Column="Expr1020"/>
              </OutputList>
              <StreamAggregate>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1018"/>
                    <ScalarOperator ScalarString="MIN([imdb].[dbo].[company_name].[name] as [cn].[name])">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                          </Identifier>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                  <DefinedValue>
                    <ColumnReference Column="Expr1019"/>
                    <ScalarOperator ScalarString="MIN([imdb].[dbo].[movie_info_idx].[info] as [miidx].[info])">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info"/>
                          </Identifier>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                  <DefinedValue>
                    <ColumnReference Column="Expr1020"/>
                    <ScalarOperator ScalarString="MIN([imdb].[dbo].[title].[title] as [t].[title])">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title"/>
                          </Identifier>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                </DefinedValues>
                <RelOp AvgRowSize="322" EstimateCPU="0.00177756" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1.59588" LogicalOp="Inner Join" NodeId="1" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="6.32126">
                  <OutputList>
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info"/>
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title"/>
                  </OutputList>
                  <MemoryFractions Input="1" Output="1"/>
                  <Hash BitmapCreator="true">
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="Opt_Bitmap1197"/>
                      </DefinedValue>
                    </DefinedValues>
                    <HashKeysBuild>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="id"/>
                    </HashKeysBuild>
                    <HashKeysProbe>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                    </HashKeysProbe>
                    <RelOp AvgRowSize="35" EstimateCPU="1.614E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="4" LogicalOp="Clustered Index Scan" NodeId="3" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00314114" TableCardinality="4">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="id"/>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="kind"/>
                      </OutputList>
                      <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="id"/>
                          </DefinedValue>
                          <DefinedValue>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="kind"/>
                          </DefinedValue>
                        </DefinedValues>
                        <Object Database="[imdb]" Schema="[dbo]" Table="[company_type]" Index="[CCI_company_type]" Alias="[ct]" IndexKind="Clustered" Storage="ColumnStore"/>
                        <Predicate>
                          <ScalarOperator ScalarString="[imdb].[dbo].[company_type].[kind] as [ct].[kind]=''production companies''">
                            <Compare CompareOp="EQ">
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="kind"/>
                                </Identifier>
                              </ScalarOperator>
                              <ScalarOperator>
                                <Const ConstValue="''production companies''"/>
                              </ScalarOperator>
                            </Compare>
                          </ScalarOperator>
                        </Predicate>
                      </IndexScan>
                    </RelOp>
                    <RelOp AvgRowSize="326" EstimateCPU="0.00177698" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="3.19175" LogicalOp="Inner Join" NodeId="4" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="6.31634">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info"/>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title"/>
                      </OutputList>
                      <MemoryFractions Input="0.894737" Output="0.894737"/>
                      <Hash BitmapCreator="true">
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Column="Opt_Bitmap1127"/>
                          </DefinedValue>
                        </DefinedValues>
                        <HashKeysBuild>
                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="id"/>
                        </HashKeysBuild>
                        <HashKeysProbe>
                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id"/>
                        </HashKeysProbe>
                        <RelOp AvgRowSize="28" EstimateCPU="2.813E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="113" LogicalOp="Clustered Index Scan" NodeId="6" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00315313" TableCardinality="113">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="id"/>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="info"/>
                          </OutputList>
                          <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="id"/>
                              </DefinedValue>
                              <DefinedValue>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="info"/>
                              </DefinedValue>
                            </DefinedValues>
                            <Object Database="[imdb]" Schema="[dbo]" Table="[info_type]" Index="[CCI_info_type]" Alias="[it]" IndexKind="Clustered" Storage="ColumnStore"/>
                            <Predicate>
                              <ScalarOperator ScalarString="[imdb].[dbo].[info_type].[info] as [it].[info]=''plot''">
                                <Compare CompareOp="EQ">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="info"/>
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Const ConstValue="''plot''"/>
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                            </Predicate>
                          </IndexScan>
                        </RelOp>
                        <RelOp AvgRowSize="330" EstimateCPU="0.00177657" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1.59588" LogicalOp="Inner Join" NodeId="7" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="6.3114">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id"/>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info"/>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title"/>
                          </OutputList>
                          <MemoryFractions Input="0.789474" Output="0.789474"/>
                          <Hash BitmapCreator="true">
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Column="Opt_Bitmap1128"/>
                              </DefinedValue>
                            </DefinedValues>
                            <HashKeysBuild>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="id"/>
                            </HashKeysBuild>
                            <HashKeysProbe>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id"/>
                            </HashKeysProbe>
                            <RelOp AvgRowSize="24" EstimateCPU="1.647E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="7" LogicalOp="Clustered Index Scan" NodeId="9" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00314147" TableCardinality="7">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="id"/>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="kind"/>
                              </OutputList>
                              <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="id"/>
                                  </DefinedValue>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="kind"/>
                                  </DefinedValue>
                                </DefinedValues>
                                <Object Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Index="[CCI_kind_type]" Alias="[kt]" IndexKind="Clustered" Storage="ColumnStore"/>
                                <Predicate>
                                  <ScalarOperator ScalarString="[imdb].[dbo].[kind_type].[kind] as [kt].[kind]=''tv series''">
                                    <Compare CompareOp="EQ">
                                      <ScalarOperator>
                                        <Identifier>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="kind"/>
                                        </Identifier>
                                      </ScalarOperator>
                                      <ScalarOperator>
                                        <Const ConstValue="''tv series''"/>
                                      </ScalarOperator>
                                    </Compare>
                                  </ScalarOperator>
                                </Predicate>
                              </IndexScan>
                            </RelOp>
                            <RelOp AvgRowSize="334" EstimateCPU="0.00177651" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Inner Join" NodeId="10" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="6.30648">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id"/>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info"/>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title"/>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id"/>
                              </OutputList>
                              <MemoryFractions Input="0.684211" Output="0.684211"/>
                              <Hash BitmapCreator="true">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Column="Opt_Bitmap1129"/>
                                  </DefinedValue>
                                </DefinedValues>
                                <HashKeysBuild>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="id"/>
                                </HashKeysBuild>
                                <HashKeysProbe>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id"/>
                                </HashKeysProbe>
                                <RelOp AvgRowSize="31" EstimateCPU="2.813E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="113" LogicalOp="Clustered Index Scan" NodeId="12" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00315313" TableCardinality="113">
                                  <OutputList>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="id"/>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="info"/>
                                  </OutputList>
                                  <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="id"/>
                                      </DefinedValue>
                                      <DefinedValue>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="info"/>
                                      </DefinedValue>
                                    </DefinedValues>
                                    <Object Database="[imdb]" Schema="[dbo]" Table="[info_type]" Index="[CCI_info_type]" Alias="[it2]" IndexKind="Clustered" Storage="ColumnStore"/>
                                    <Predicate>
                                      <ScalarOperator ScalarString="[imdb].[dbo].[info_type].[info] as [it2].[info]=''release dates''">
                                        <Compare CompareOp="EQ">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="info"/>
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="''release dates''"/>
                                          </ScalarOperator>
                                        </Compare>
                                      </ScalarOperator>
                                    </Predicate>
                                  </IndexScan>
                                </RelOp>
                                <RelOp AvgRowSize="338" EstimateCPU="0.00184542" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Inner Join" NodeId="13" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="6.30154">
                                  <OutputList>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id"/>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id"/>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info"/>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title"/>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id"/>
                                  </OutputList>
                                  <MemoryFractions Input="0.578947" Output="0.578947"/>
                                  <Hash BitmapCreator="true">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Column="Opt_Bitmap1130"/>
                                      </DefinedValue>
                                    </DefinedValues>
                                    <HashKeysBuild>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id"/>
                                    </HashKeysBuild>
                                    <HashKeysProbe>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id"/>
                                    </HashKeysProbe>
                                    <RelOp AvgRowSize="331" EstimateCPU="0.00210027" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="4.41537" LogicalOp="Inner Join" NodeId="14" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="5.94104">
                                      <OutputList>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id"/>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id"/>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title"/>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id"/>
                                      </OutputList>
                                      <MemoryFractions Input="0.473684" Output="0.473684"/>
                                      <Hash BitmapCreator="true">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Column="Opt_Bitmap1121"/>
                                          </DefinedValue>
                                        </DefinedValues>
                                        <HashKeysBuild>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id"/>
                                        </HashKeysBuild>
                                        <HashKeysProbe>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id"/>
                                        </HashKeysProbe>
                                        <RelOp AvgRowSize="150" EstimateCPU="0.00190594" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="44.0367" LogicalOp="Inner Join" NodeId="15" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="4.27176">
                                          <OutputList>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id"/>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id"/>
                                          </OutputList>
                                          <MemoryFractions Input="0.315789" Output="0.315789"/>
                                          <Hash BitmapCreator="true">
                                            <DefinedValues>
                                              <DefinedValue>
                                                <ColumnReference Column="Opt_Bitmap1111"/>
                                              </DefinedValue>
                                            </DefinedValues>
                                            <HashKeysBuild>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id"/>
                                            </HashKeysBuild>
                                            <HashKeysProbe>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id"/>
                                            </HashKeysProbe>
                                            <RelOp AvgRowSize="147" EstimateCPU="0.0258654" EstimateIO="0.179421" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="15.7227" EstimatedRowsRead="234997" LogicalOp="Clustered Index Scan" NodeId="17" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.205287" TableCardinality="234997">
                                              <OutputList>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id"/>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code"/>
                                              </OutputList>
                                              <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                                <DefinedValues>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id"/>
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name"/>
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code"/>
                                                  </DefinedValue>
                                                </DefinedValues>
                                                <Object Database="[imdb]" Schema="[dbo]" Table="[company_name]" Index="[CCI_company_name]" Alias="[cn]" IndexKind="Clustered" Storage="ColumnStore"/>
                                                <Predicate>
                                                  <ScalarOperator ScalarString="[imdb].[dbo].[company_name].[country_code] as [cn].[country_code]=''[as]''">
                                                    <Compare CompareOp="EQ">
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code"/>
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="''[as]''"/>
                                                      </ScalarOperator>
                                                    </Compare>
                                                  </ScalarOperator>
                                                </Predicate>
                                              </IndexScan>
                                            </RelOp>
                                            <RelOp AvgRowSize="23" EstimateCPU="0.00213763" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="38.3558" LogicalOp="Inner Join" NodeId="18" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="4.05328">
                                              <OutputList>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id"/>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id"/>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id"/>
                                              </OutputList>
                                              <MemoryFractions Input="0.210526" Output="0.210526"/>
                                              <Hash BitmapCreator="true">
                                                <DefinedValues>
                                                  <DefinedValue>
                                                    <ColumnReference Column="Opt_Bitmap1112"/>
                                                  </DefinedValue>
                                                </DefinedValues>
                                                <HashKeysBuild>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id"/>
                                                </HashKeysBuild>
                                                <HashKeysProbe>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id"/>
                                                </HashKeysProbe>
                                                <RelOp AvgRowSize="19" EstimateCPU="0.28702" EstimateIO="0.406088" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="260.913" EstimatedRowsRead="260.913" LogicalOp="Clustered Index Scan" NodeId="20" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.693108" TableCardinality="2609130">
                                                  <OutputList>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id"/>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id"/>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                                                  </OutputList>
                                                  <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                                    <DefinedValues>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id"/>
                                                      </DefinedValue>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id"/>
                                                      </DefinedValue>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                                                      </DefinedValue>
                                                    </DefinedValues>
                                                    <Object Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Index="[CCI_movie_companies]" Alias="[mc]" IndexKind="Clustered" Storage="ColumnStore"/>
                                                    <Predicate>
                                                      <ScalarOperator ScalarString="PROBE([Opt_Bitmap1111],[imdb].[dbo].[movie_companies].[company_id] as [mc].[company_id]) AND PROBE([Opt_Bitmap1197],[imdb].[dbo].[movie_companies].[company_type_id] as [mc].[company_type_id])">
                                                        <Logical Operation="AND">
                                                          <ScalarOperator>
                                                            <Intrinsic FunctionName="PROBE">
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Column="Opt_Bitmap1111"/>
                                                                </Identifier>
                                                              </ScalarOperator>
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id"/>
                                                                </Identifier>
                                                              </ScalarOperator>
                                                            </Intrinsic>
                                                          </ScalarOperator>
                                                          <ScalarOperator>
                                                            <Intrinsic FunctionName="PROBE">
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Column="Opt_Bitmap1197"/>
                                                                </Identifier>
                                                              </ScalarOperator>
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id"/>
                                                                </Identifier>
                                                              </ScalarOperator>
                                                            </Intrinsic>
                                                          </ScalarOperator>
                                                        </Logical>
                                                      </ScalarOperator>
                                                    </Predicate>
                                                  </IndexScan>
                                                </RelOp>
                                                <RelOp AvgRowSize="15" EstimateCPU="1.63194" EstimateIO="1.72609" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="14.8357" EstimatedRowsRead="14.8357" LogicalOp="Clustered Index Scan" NodeId="22" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="3.35803" TableCardinality="14835700">
                                                  <OutputList>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id"/>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id"/>
                                                  </OutputList>
                                                  <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                                    <DefinedValues>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id"/>
                                                      </DefinedValue>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id"/>
                                                      </DefinedValue>
                                                    </DefinedValues>
                                                    <Object Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Index="[CCI_movie_info]" Alias="[mi]" IndexKind="Clustered" Storage="ColumnStore"/>
                                                    <Predicate>
                                                      <ScalarOperator ScalarString="PROBE([Opt_Bitmap1112],[imdb].[dbo].[movie_info].[movie_id] as [mi].[movie_id]) AND PROBE([Opt_Bitmap1129],[imdb].[dbo].[movie_info].[info_type_id] as [mi].[info_type_id])">
                                                        <Logical Operation="AND">
                                                          <ScalarOperator>
                                                            <Intrinsic FunctionName="PROBE">
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Column="Opt_Bitmap1112"/>
                                                                </Identifier>
                                                              </ScalarOperator>
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id"/>
                                                                </Identifier>
                                                              </ScalarOperator>
                                                            </Intrinsic>
                                                          </ScalarOperator>
                                                          <ScalarOperator>
                                                            <Intrinsic FunctionName="PROBE">
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Column="Opt_Bitmap1129"/>
                                                                </Identifier>
                                                              </ScalarOperator>
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id"/>
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
                                        <RelOp AvgRowSize="194" EstimateCPU="0.27813" EstimateIO="1.38905" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Clustered Index Scan" NodeId="24" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="1.66718" TableCardinality="2528310">
                                          <OutputList>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id"/>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title"/>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id"/>
                                          </OutputList>
                                          <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                            <DefinedValues>
                                              <DefinedValue>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id"/>
                                              </DefinedValue>
                                              <DefinedValue>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title"/>
                                              </DefinedValue>
                                              <DefinedValue>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id"/>
                                              </DefinedValue>
                                            </DefinedValues>
                                            <Object Database="[imdb]" Schema="[dbo]" Table="[title]" Index="[CCI_title]" Alias="[t]" IndexKind="Clustered" Storage="ColumnStore"/>
                                            <Predicate>
                                              <ScalarOperator ScalarString="PROBE([Opt_Bitmap1121],[imdb].[dbo].[title].[id] as [t].[id]) AND PROBE([Opt_Bitmap1128],[imdb].[dbo].[title].[kind_id] as [t].[kind_id])">
                                                <Logical Operation="AND">
                                                  <ScalarOperator>
                                                    <Intrinsic FunctionName="PROBE">
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Column="Opt_Bitmap1121"/>
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id"/>
                                                        </Identifier>
                                                      </ScalarOperator>
                                                    </Intrinsic>
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Intrinsic FunctionName="PROBE">
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Column="Opt_Bitmap1128"/>
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id"/>
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
                                    <RelOp AvgRowSize="24" EstimateCPU="0.15182" EstimateIO="0.206829" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Clustered Index Scan" NodeId="26" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.358648" TableCardinality="1380040">
                                      <OutputList>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id"/>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id"/>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info"/>
                                      </OutputList>
                                      <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id"/>
                                          </DefinedValue>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id"/>
                                          </DefinedValue>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info"/>
                                          </DefinedValue>
                                        </DefinedValues>
                                        <Object Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Index="[CCI_movie_info_idx]" Alias="[miidx]" IndexKind="Clustered" Storage="ColumnStore"/>
                                        <Predicate>
                                          <ScalarOperator ScalarString="PROBE([Opt_Bitmap1130],[imdb].[dbo].[movie_info_idx].[movie_id] as [miidx].[movie_id]) AND PROBE([Opt_Bitmap1127],[imdb].[dbo].[movie_info_idx].[info_type_id] as [miidx].[info_type_id])">
                                            <Logical Operation="AND">
                                              <ScalarOperator>
                                                <Intrinsic FunctionName="PROBE">
                                                  <ScalarOperator>
                                                    <Identifier>
                                                      <ColumnReference Column="Opt_Bitmap1130"/>
                                                    </Identifier>
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Identifier>
                                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id"/>
                                                    </Identifier>
                                                  </ScalarOperator>
                                                </Intrinsic>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Intrinsic FunctionName="PROBE">
                                                  <ScalarOperator>
                                                    <Identifier>
                                                      <ColumnReference Column="Opt_Bitmap1127"/>
                                                    </Identifier>
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Identifier>
                                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id"/>
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