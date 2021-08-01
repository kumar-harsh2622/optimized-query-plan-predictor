
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
WHERE cn.country_code ='[pl]'
  AND ct.kind ='special effects companies'
  AND it.info ='rating'
  AND it2.info ='release dates'
  AND kt.kind ='tv mini series'
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
OPTION( MAXDOP 1,USE PLAN N'<?xml version="1.0" encoding="utf-16"?>
<ShowPlanXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" Version="1.539" Build="15.0.2080.9" xmlns="http://schemas.microsoft.com/sqlserver/2004/07/showplan">
  <BatchSequence>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="1" StatementEstRows="1" StatementId="1" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="TimeOut" CardinalityEstimationModelVersion="150" StatementSubTreeCost="6.38623" StatementText="&#xD;&#xA;SELECT MIN(cn.name) AS producing_company,&#xD;&#xA;       MIN(miidx.info) AS rating,&#xD;&#xA;       MIN(t.title) AS movie&#xD;&#xA;FROM imdb.dbo.company_name AS cn,&#xD;&#xA;     imdb.dbo.company_type AS ct,&#xD;&#xA;     imdb.dbo.info_type AS it,&#xD;&#xA;     imdb.dbo.info_type AS it2,&#xD;&#xA;     imdb.dbo.kind_type AS kt,&#xD;&#xA;     imdb.dbo.movie_companies AS mc,&#xD;&#xA;     imdb.dbo.movie_info AS mi,&#xD;&#xA;     imdb.dbo.movie_info_idx AS miidx,&#xD;&#xA;     imdb.dbo.title AS t&#xD;&#xA;WHERE cn.country_code =''[pl]''&#xD;&#xA;  AND ct.kind =''special effects companies''&#xD;&#xA;  AND it.info =''rating''&#xD;&#xA;  AND it2.info =''release dates''&#xD;&#xA;  AND kt.kind =''tv mini series''&#xD;&#xA;  AND mi.movie_id = t.id&#xD;&#xA;  AND it2.id = mi.info_type_id&#xD;&#xA;  AND kt.id = t.kind_id&#xD;&#xA;  AND mc.movie_id = t.id&#xD;&#xA;  AND cn.id = mc.company_id&#xD;&#xA;  AND ct.id = mc.company_type_id&#xD;&#xA;  AND miidx.movie_id = t.id&#xD;&#xA;  AND it.id = miidx.info_type_id&#xD;&#xA;  AND mi.movie_id = miidx.movie_id&#xD;&#xA;  AND mi.movie_id = mc.movie_id&#xD;&#xA;  AND miidx.movie_id = mc.movie_id" StatementType="SELECT" QueryHash="0xBF1AA7EF32A8E09A" QueryPlanHash="0x5E8055EAA1F8B51F" RetrievedFromCache="false" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan NonParallelPlanReason="MaxDOPSetToOne" CachedPlanSize="328" CompileTime="54" CompileCPU="54" CompileMemory="4480">
            <MissingIndexes>
              <MissingIndexGroup Impact="26.3916">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[title]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[id]" ColumnId="1" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[title]" ColumnId="2" />
                    <Column Name="[kind_id]" ColumnId="4" />
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
              <MissingIndexGroup Impact="52.6631">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[movie_info]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[movie_id]" ColumnId="2" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[info_type_id]" ColumnId="3" />
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
            </MissingIndexes>
            <MemoryGrantInfo SerialRequiredMemory="8192" SerialDesiredMemory="11144" GrantedMemory="0" MaxUsedMemory="0" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="103769" EstimatedPagesCached="51884" EstimatedAvailableDegreeOfParallelism="1" MaxCompileMemory="833984" />
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_type]" Statistics="[_WA_Sys_00000002_2E1BDC42]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T01:12:44.23" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[info_type]" Statistics="[_WA_Sys_00000001_31EC6D26]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T00:18:57.51" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Statistics="[_WA_Sys_00000002_3B75D760]" ModificationCount="0" SamplingPercent="82.7381" LastUpdate="2021-06-17T00:18:59.08" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Statistics="[_WA_Sys_00000002_46E78A0C]" ModificationCount="0" SamplingPercent="3.124" LastUpdate="2021-06-17T01:12:46.43" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[title]" Statistics="[_WA_Sys_00000004_44FF419A]" ModificationCount="0" SamplingPercent="8.75228" LastUpdate="2021-06-17T01:12:47.34" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_name]" Statistics="[_WA_Sys_00000001_2C3393D0]" ModificationCount="0" SamplingPercent="63.4204" LastUpdate="2021-06-15T23:44:40.13" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[info_type]" Statistics="[_WA_Sys_00000002_31EC6D26]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T00:18:55.53" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Statistics="[_WA_Sys_00000001_35BCFE0A]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T01:12:47.03" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_name]" Statistics="[company_name_country_code]" ModificationCount="0" SamplingPercent="63.4204" LastUpdate="2021-06-19T01:52:15.69" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[title]" Statistics="[_WA_Sys_00000001_44FF419A]" ModificationCount="0" SamplingPercent="8.75228" LastUpdate="2021-06-15T23:44:40.63" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[movie_companies_company_id]" ModificationCount="0" SamplingPercent="37.4542" LastUpdate="2021-06-19T02:03:52.37" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Statistics="[_WA_Sys_00000002_35BCFE0A]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-17T01:12:44.42" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Statistics="[_WA_Sys_00000003_46E78A0C]" ModificationCount="0" SamplingPercent="3.124" LastUpdate="2021-06-17T01:12:47.02" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[movie_companies_company_type_id]" ModificationCount="0" SamplingPercent="37.4542" LastUpdate="2021-06-19T02:06:42.68" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[movie_companies_movie_id]" ModificationCount="0" SamplingPercent="37.4542" LastUpdate="2021-06-19T02:03:51.47" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Statistics="[_WA_Sys_00000003_3B75D760]" ModificationCount="0" SamplingPercent="82.7381" LastUpdate="2021-06-17T00:18:58.14" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_type]" Statistics="[_WA_Sys_00000001_2E1BDC42]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-15T23:44:40.35" />
            </OptimizerStatsUsage>
            <RelOp AvgRowSize="322" EstimateCPU="6.45584E-05" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="0" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="6.38623">
              <OutputList>
                <ColumnReference Column="Expr1018" />
                <ColumnReference Column="Expr1019" />
                <ColumnReference Column="Expr1020" />
              </OutputList>
              <StreamAggregate>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1018" />
                    <ScalarOperator ScalarString="MIN([imdb].[dbo].[company_name].[name] as [cn].[name])">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name" />
                          </Identifier>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                  <DefinedValue>
                    <ColumnReference Column="Expr1019" />
                    <ScalarOperator ScalarString="MIN([imdb].[dbo].[movie_info_idx].[info] as [miidx].[info])">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                          </Identifier>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                  <DefinedValue>
                    <ColumnReference Column="Expr1020" />
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
                <RelOp AvgRowSize="322" EstimateCPU="0.00181937" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="106.764" LogicalOp="Inner Join" NodeId="1" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="6.38616">
                  <OutputList>
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name" />
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                  </OutputList>
                  <MemoryFractions Input="1" Output="1" />
                  <Hash BitmapCreator="true">
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="Opt_Bitmap1200" />
                      </DefinedValue>
                    </DefinedValues>
                    <HashKeysBuild>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="id" />
                    </HashKeysBuild>
                    <HashKeysProbe>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id" />
                    </HashKeysProbe>
                    <RelOp AvgRowSize="31" EstimateCPU="2.813E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="113" LogicalOp="Clustered Index Scan" NodeId="3" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00315313" TableCardinality="113">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="id" />
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="info" />
                      </OutputList>
                      <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="id" />
                          </DefinedValue>
                          <DefinedValue>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="info" />
                          </DefinedValue>
                        </DefinedValues>
                        <Object Database="[imdb]" Schema="[dbo]" Table="[info_type]" Index="[CCI_info_type]" Alias="[it2]" IndexKind="Clustered" Storage="ColumnStore" />
                        <Predicate>
                          <ScalarOperator ScalarString="[imdb].[dbo].[info_type].[info] as [it2].[info]=''release dates''">
                            <Compare CompareOp="EQ">
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it2]" Column="info" />
                                </Identifier>
                              </ScalarOperator>
                              <ScalarOperator>
                                <Const ConstValue="''release dates''" />
                              </ScalarOperator>
                            </Compare>
                          </ScalarOperator>
                        </Predicate>
                      </IndexScan>
                    </RelOp>
                    <RelOp AvgRowSize="326" EstimateCPU="0.00901316" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="75.8024" LogicalOp="Inner Join" NodeId="4" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="6.38118">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name" />
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id" />
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                      </OutputList>
                      <MemoryFractions Input="0.98916" Output="0.98916" />
                      <Hash BitmapCreator="true">
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Column="Opt_Bitmap1201" />
                          </DefinedValue>
                        </DefinedValues>
                        <HashKeysBuild>
                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                        </HashKeysBuild>
                        <HashKeysProbe>
                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id" />
                        </HashKeysProbe>
                        <RelOp AvgRowSize="326" EstimateCPU="0.00194003" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="458.116" LogicalOp="Inner Join" NodeId="5" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="3.01413">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                          </OutputList>
                          <MemoryFractions Input="0.853659" Output="0.853659" />
                          <Hash BitmapCreator="true">
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Column="Opt_Bitmap1081" />
                              </DefinedValue>
                            </DefinedValues>
                            <HashKeysBuild>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="id" />
                            </HashKeysBuild>
                            <HashKeysProbe>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id" />
                            </HashKeysProbe>
                            <RelOp AvgRowSize="24" EstimateCPU="1.647E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="7" LogicalOp="Clustered Index Scan" NodeId="7" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00314147" TableCardinality="7">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="id" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="kind" />
                              </OutputList>
                              <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="id" />
                                  </DefinedValue>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="kind" />
                                  </DefinedValue>
                                </DefinedValues>
                                <Object Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Index="[CCI_kind_type]" Alias="[kt]" IndexKind="Clustered" Storage="ColumnStore" />
                                <Predicate>
                                  <ScalarOperator ScalarString="[imdb].[dbo].[kind_type].[kind] as [kt].[kind]=''tv mini series''">
                                    <Compare CompareOp="EQ">
                                      <ScalarOperator>
                                        <Identifier>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[kind_type]" Alias="[kt]" Column="kind" />
                                        </Identifier>
                                      </ScalarOperator>
                                      <ScalarOperator>
                                        <Const ConstValue="''tv mini series''" />
                                      </ScalarOperator>
                                    </Compare>
                                  </ScalarOperator>
                                </Predicate>
                              </IndexScan>
                            </RelOp>
                            <RelOp AvgRowSize="330" EstimateCPU="0.0221081" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="274.87" LogicalOp="Inner Join" NodeId="8" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="3.00905">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id" />
                              </OutputList>
                              <MemoryFractions Input="0.837398" Output="0.837398" />
                              <Hash BitmapCreator="true">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Column="Opt_Bitmap1082" />
                                  </DefinedValue>
                                </DefinedValues>
                                <HashKeysBuild>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id" />
                                </HashKeysBuild>
                                <HashKeysProbe>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                </HashKeysProbe>
                                <RelOp AvgRowSize="149" EstimateCPU="0.00263705" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="2741.42" LogicalOp="Inner Join" NodeId="9" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="1.31976">
                                  <OutputList>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                                  </OutputList>
                                  <MemoryFractions Input="0.739837" Output="0.739837" />
                                  <Hash BitmapCreator="true">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Column="Opt_Bitmap1083" />
                                      </DefinedValue>
                                    </DefinedValues>
                                    <HashKeysBuild>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[info_type]" Alias="[it]" Column="id" />
                                    </HashKeysBuild>
                                    <HashKeysProbe>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id" />
                                    </HashKeysProbe>
                                    <RelOp AvgRowSize="28" EstimateCPU="2.813E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="113" LogicalOp="Clustered Index Scan" NodeId="11" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00315313" TableCardinality="113">
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
                                      </IndexScan>
                                    </RelOp>
                                    <RelOp AvgRowSize="153" EstimateCPU="0.0100499" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1370.71" LogicalOp="Inner Join" NodeId="12" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="1.31396">
                                      <OutputList>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                                      </OutputList>
                                      <MemoryFractions Input="0.715447" Output="0.715447" />
                                      <Hash BitmapCreator="true">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Column="Opt_Bitmap1090" />
                                          </DefinedValue>
                                        </DefinedValues>
                                        <HashKeysBuild>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id" />
                                        </HashKeysBuild>
                                        <HashKeysProbe>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                        </HashKeysProbe>
                                        <RelOp AvgRowSize="147" EstimateCPU="0.0258654" EstimateIO="0.179421" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1051.85" EstimatedRowsRead="234997" LogicalOp="Clustered Index Scan" NodeId="14" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.205287" TableCardinality="234997">
                                          <OutputList>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id" />
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name" />
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code" />
                                          </OutputList>
                                          <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                            <DefinedValues>
                                              <DefinedValue>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id" />
                                              </DefinedValue>
                                              <DefinedValue>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="name" />
                                              </DefinedValue>
                                              <DefinedValue>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code" />
                                              </DefinedValue>
                                            </DefinedValues>
                                            <Object Database="[imdb]" Schema="[dbo]" Table="[company_name]" Index="[CCI_company_name]" Alias="[cn]" IndexKind="Clustered" Storage="ColumnStore" />
                                            <Predicate>
                                              <ScalarOperator ScalarString="[imdb].[dbo].[company_name].[country_code] as [cn].[country_code]=''[pl]''">
                                                <Compare CompareOp="EQ">
                                                  <ScalarOperator>
                                                    <Identifier>
                                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code" />
                                                    </Identifier>
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Const ConstValue="''[pl]''" />
                                                  </ScalarOperator>
                                                </Compare>
                                              </ScalarOperator>
                                            </Predicate>
                                          </IndexScan>
                                        </RelOp>
                                        <RelOp AvgRowSize="28" EstimateCPU="0.0177222" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1784.57" LogicalOp="Inner Join" NodeId="15" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="1.08734">
                                          <OutputList>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id" />
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id" />
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                                          </OutputList>
                                          <MemoryFractions Input="0.455285" Output="0.455285" />
                                          <Hash BitmapCreator="true">
                                            <DefinedValues>
                                              <DefinedValue>
                                                <ColumnReference Column="Opt_Bitmap1093" />
                                              </DefinedValue>
                                            </DefinedValues>
                                            <HashKeysBuild>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                            </HashKeysBuild>
                                            <HashKeysProbe>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id" />
                                            </HashKeysProbe>
                                            <RelOp AvgRowSize="15" EstimateCPU="0.014712" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="13045.6" LogicalOp="Inner Join" NodeId="16" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="0.710965">
                                              <OutputList>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                              </OutputList>
                                              <MemoryFractions Input="0.0433604" Output="0.0433604" />
                                              <Hash BitmapCreator="true">
                                                <DefinedValues>
                                                  <DefinedValue>
                                                    <ColumnReference Column="Opt_Bitmap1049" />
                                                  </DefinedValue>
                                                </DefinedValues>
                                                <HashKeysBuild>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="id" />
                                                </HashKeysBuild>
                                                <HashKeysProbe>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                                                </HashKeysProbe>
                                                <RelOp AvgRowSize="35" EstimateCPU="1.614E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" EstimatedRowsRead="4" LogicalOp="Clustered Index Scan" NodeId="18" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00314114" TableCardinality="4">
                                                  <OutputList>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="id" />
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="kind" />
                                                  </OutputList>
                                                  <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                                    <DefinedValues>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="id" />
                                                      </DefinedValue>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="kind" />
                                                      </DefinedValue>
                                                    </DefinedValues>
                                                    <Object Database="[imdb]" Schema="[dbo]" Table="[company_type]" Index="[CCI_company_type]" Alias="[ct]" IndexKind="Clustered" Storage="ColumnStore" />
                                                    <Predicate>
                                                      <ScalarOperator ScalarString="[imdb].[dbo].[company_type].[kind] as [ct].[kind]=''special effects companies''">
                                                        <Compare CompareOp="EQ">
                                                          <ScalarOperator>
                                                            <Identifier>
                                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="kind" />
                                                            </Identifier>
                                                          </ScalarOperator>
                                                          <ScalarOperator>
                                                            <Const ConstValue="''special effects companies''" />
                                                          </ScalarOperator>
                                                        </Compare>
                                                      </ScalarOperator>
                                                    </Predicate>
                                                  </IndexScan>
                                                </RelOp>
                                                <RelOp AvgRowSize="19" EstimateCPU="0.28702" EstimateIO="0.406088" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="26091.3" EstimatedRowsRead="26091.3" LogicalOp="Clustered Index Scan" NodeId="20" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.693108" TableCardinality="2609130">
                                                  <OutputList>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                                                  </OutputList>
                                                  <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                                    <DefinedValues>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                                      </DefinedValue>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                                      </DefinedValue>
                                                      <DefinedValue>
                                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                                                      </DefinedValue>
                                                    </DefinedValues>
                                                    <Object Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Index="[CCI_movie_companies]" Alias="[mc]" IndexKind="Clustered" Storage="ColumnStore" />
                                                    <Predicate>
                                                      <ScalarOperator ScalarString="PROBE([Opt_Bitmap1049],[imdb].[dbo].[movie_companies].[company_type_id] as [mc].[company_type_id]) AND PROBE([Opt_Bitmap1090],[imdb].[dbo].[movie_companies].[company_id] as [mc].[company_id])">
                                                        <Logical Operation="AND">
                                                          <ScalarOperator>
                                                            <Intrinsic FunctionName="PROBE">
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Column="Opt_Bitmap1049" />
                                                                </Identifier>
                                                              </ScalarOperator>
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                                                                </Identifier>
                                                              </ScalarOperator>
                                                            </Intrinsic>
                                                          </ScalarOperator>
                                                          <ScalarOperator>
                                                            <Intrinsic FunctionName="PROBE">
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Column="Opt_Bitmap1090" />
                                                                </Identifier>
                                                              </ScalarOperator>
                                                              <ScalarOperator>
                                                                <Identifier>
                                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
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
                                            <RelOp AvgRowSize="24" EstimateCPU="0.15182" EstimateIO="0.206829" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1380.04" EstimatedRowsRead="1380.04" LogicalOp="Clustered Index Scan" NodeId="22" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.358648" TableCardinality="1380040">
                                              <OutputList>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id" />
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id" />
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                                              </OutputList>
                                              <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                                <DefinedValues>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id" />
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id" />
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info" />
                                                  </DefinedValue>
                                                </DefinedValues>
                                                <Object Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Index="[CCI_movie_info_idx]" Alias="[miidx]" IndexKind="Clustered" Storage="ColumnStore" />
                                                <Predicate>
                                                  <ScalarOperator ScalarString="PROBE([Opt_Bitmap1093],[imdb].[dbo].[movie_info_idx].[movie_id] as [miidx].[movie_id]) AND PROBE([Opt_Bitmap1083],[imdb].[dbo].[movie_info_idx].[info_type_id] as [miidx].[info_type_id])">
                                                    <Logical Operation="AND">
                                                      <ScalarOperator>
                                                        <Intrinsic FunctionName="PROBE">
                                                          <ScalarOperator>
                                                            <Identifier>
                                                              <ColumnReference Column="Opt_Bitmap1093" />
                                                            </Identifier>
                                                          </ScalarOperator>
                                                          <ScalarOperator>
                                                            <Identifier>
                                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="movie_id" />
                                                            </Identifier>
                                                          </ScalarOperator>
                                                        </Intrinsic>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Intrinsic FunctionName="PROBE">
                                                          <ScalarOperator>
                                                            <Identifier>
                                                              <ColumnReference Column="Opt_Bitmap1083" />
                                                            </Identifier>
                                                          </ScalarOperator>
                                                          <ScalarOperator>
                                                            <Identifier>
                                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info_idx]" Alias="[miidx]" Column="info_type_id" />
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
                                <RelOp AvgRowSize="194" EstimateCPU="0.27813" EstimateIO="1.38905" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="252.831" EstimatedRowsRead="252.831" LogicalOp="Clustered Index Scan" NodeId="24" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="1.66718" TableCardinality="2528310">
                                  <OutputList>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id" />
                                  </OutputList>
                                  <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                      </DefinedValue>
                                      <DefinedValue>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                                      </DefinedValue>
                                      <DefinedValue>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id" />
                                      </DefinedValue>
                                    </DefinedValues>
                                    <Object Database="[imdb]" Schema="[dbo]" Table="[title]" Index="[CCI_title]" Alias="[t]" IndexKind="Clustered" Storage="ColumnStore" />
                                    <Predicate>
                                      <ScalarOperator ScalarString="PROBE([Opt_Bitmap1082],[imdb].[dbo].[title].[id] as [t].[id]) AND PROBE([Opt_Bitmap1081],[imdb].[dbo].[title].[kind_id] as [t].[kind_id])">
                                        <Logical Operation="AND">
                                          <ScalarOperator>
                                            <Intrinsic FunctionName="PROBE">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="Opt_Bitmap1082" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                                </Identifier>
                                              </ScalarOperator>
                                            </Intrinsic>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Intrinsic FunctionName="PROBE">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="Opt_Bitmap1081" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="kind_id" />
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
                        <RelOp AvgRowSize="15" EstimateCPU="1.63194" EstimateIO="1.72609" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="148.357" EstimatedRowsRead="148.357" LogicalOp="Clustered Index Scan" NodeId="26" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="3.35803" TableCardinality="14835700">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id" />
                          </OutputList>
                          <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id" />
                              </DefinedValue>
                              <DefinedValue>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id" />
                              </DefinedValue>
                            </DefinedValues>
                            <Object Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Index="[CCI_movie_info]" Alias="[mi]" IndexKind="Clustered" Storage="ColumnStore" />
                            <Predicate>
                              <ScalarOperator ScalarString="PROBE([Opt_Bitmap1201],[imdb].[dbo].[movie_info].[movie_id] as [mi].[movie_id]) AND PROBE([Opt_Bitmap1200],[imdb].[dbo].[movie_info].[info_type_id] as [mi].[info_type_id])">
                                <Logical Operation="AND">
                                  <ScalarOperator>
                                    <Intrinsic FunctionName="PROBE">
                                      <ScalarOperator>
                                        <Identifier>
                                          <ColumnReference Column="Opt_Bitmap1201" />
                                        </Identifier>
                                      </ScalarOperator>
                                      <ScalarOperator>
                                        <Identifier>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="movie_id" />
                                        </Identifier>
                                      </ScalarOperator>
                                    </Intrinsic>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Intrinsic FunctionName="PROBE">
                                      <ScalarOperator>
                                        <Identifier>
                                          <ColumnReference Column="Opt_Bitmap1200" />
                                        </Identifier>
                                      </ScalarOperator>
                                      <ScalarOperator>
                                        <Identifier>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_info]" Alias="[mi]" Column="info_type_id" />
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
              </StreamAggregate>
            </RelOp>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
  </BatchSequence>
</ShowPlanXML>')