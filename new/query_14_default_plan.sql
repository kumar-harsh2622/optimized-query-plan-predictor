
SELECT MIN(chn.name) AS uncredited_voiced_character,
       MIN(t.title) AS movie
FROM imdb.dbo.char_name AS chn,
     imdb.dbo.cast_info AS ci,
     imdb.dbo.company_name AS cn,
     imdb.dbo.company_type AS ct,
     imdb.dbo.movie_companies AS mc,
     imdb.dbo.role_type AS rt,
     imdb.dbo.title AS t
WHERE ci.note LIKE '%(voice)%'
  AND ci.note LIKE '%(uncredited)%'
  AND cn.country_code = '[ve]'
  AND rt.role = 'composer'
  AND t.production_year > 2015
  AND t.id = mc.movie_id
  AND t.id = ci.movie_id
  AND ci.movie_id = mc.movie_id
  AND chn.id = ci.person_role_id
  AND rt.id = ci.role_id
  AND cn.id = mc.company_id
  AND ct.id = mc.company_type_id
  OPTION( MAXDOP 1,USE PLAN N'<?xml version="1.0" encoding="utf-16"?>
<ShowPlanXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" Version="1.539" Build="15.0.2000.5" xmlns="http://schemas.microsoft.com/sqlserver/2004/07/showplan">
  <BatchSequence>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="1" StatementEstRows="1" StatementId="1" StatementOptmLevel="FULL" StatementOptmEarlyAbortReason="TimeOut" CardinalityEstimationModelVersion="150" StatementSubTreeCost="15.4652" StatementText="&#xD;&#xA;SELECT MIN(chn.name) AS uncredited_voiced_character,&#xD;&#xA;       MIN(t.title) AS movie&#xD;&#xA;FROM imdb.dbo.char_name AS chn,&#xD;&#xA;     imdb.dbo.cast_info AS ci,&#xD;&#xA;     imdb.dbo.company_name AS cn,&#xD;&#xA;     imdb.dbo.company_type AS ct,&#xD;&#xA;     imdb.dbo.movie_companies AS mc,&#xD;&#xA;     imdb.dbo.role_type AS rt,&#xD;&#xA;     imdb.dbo.title AS t&#xD;&#xA;WHERE ci.note LIKE ''%(voice)%''&#xD;&#xA;  AND ci.note LIKE ''%(uncredited)%''&#xD;&#xA;  AND cn.country_code = ''[ve]''&#xD;&#xA;  AND rt.role = ''composer''&#xD;&#xA;  AND t.production_year &gt; 2015&#xD;&#xA;  AND t.id = mc.movie_id&#xD;&#xA;  AND t.id = ci.movie_id&#xD;&#xA;  AND ci.movie_id = mc.movie_id&#xD;&#xA;  AND chn.id = ci.person_role_id&#xD;&#xA;  AND rt.id = ci.role_id&#xD;&#xA;  AND cn.id = mc.company_id&#xD;&#xA;  AND ct.id = mc.company_type_id" StatementType="SELECT" QueryHash="0xA652FA9D34608ADC" QueryPlanHash="0xC3F9B60F07ABAD52" RetrievedFromCache="false" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true" />
          <QueryPlan NonParallelPlanReason="NoParallelPlansInDesktopOrExpressEdition" CachedPlanSize="224" CompileTime="80" CompileCPU="80" CompileMemory="4680">
            <MissingIndexes>
              <MissingIndexGroup Impact="66.9658">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[cast_info]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[movie_id]" ColumnId="3" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[person_role_id]" ColumnId="4" />
                    <Column Name="[note]" ColumnId="5" />
                    <Column Name="[role_id]" ColumnId="7" />
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
              <MissingIndexGroup Impact="16.9893">
                <MissingIndex Database="[imdb]" Schema="[dbo]" Table="[char_name]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[id]" ColumnId="1" />
                  </ColumnGroup>
                  <ColumnGroup Usage="INCLUDE">
                    <Column Name="[name]" ColumnId="2" />
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
              <MissingIndexGroup Impact="10.95">
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
            <MemoryGrantInfo SerialRequiredMemory="4400" SerialDesiredMemory="138544" GrantedMemory="0" MaxUsedMemory="0" />
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="103769" EstimatedPagesCached="51884" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="87632" />
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[role_type]" Statistics="[_WA_Sys_00000002_4316F928]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-15T22:51:17.57" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Statistics="[cast_info_role_id]" ModificationCount="0" SamplingPercent="2.71761" LastUpdate="2021-06-19T00:56:53.76" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[title]" Statistics="[title_production_year]" ModificationCount="0" SamplingPercent="8.75228" LastUpdate="2021-06-19T02:35:10.08" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_name]" Statistics="[_WA_Sys_00000001_2C3393D0]" ModificationCount="0" SamplingPercent="63.4204" LastUpdate="2021-06-15T23:44:40.13" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_name]" Statistics="[company_name_country_code]" ModificationCount="0" SamplingPercent="63.4204" LastUpdate="2021-06-19T01:52:15.69" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[title]" Statistics="[_WA_Sys_00000001_44FF419A]" ModificationCount="0" SamplingPercent="8.75228" LastUpdate="2021-06-15T23:44:40.63" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[movie_companies_company_id]" ModificationCount="0" SamplingPercent="37.4542" LastUpdate="2021-06-19T02:03:52.37" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Statistics="[cast_info_person_role_id]" ModificationCount="0" SamplingPercent="2.71761" LastUpdate="2021-06-19T00:56:51.62" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[char_name]" Statistics="[_WA_Sys_00000001_286302EC]" ModificationCount="0" SamplingPercent="6.69141" LastUpdate="2021-06-15T23:44:39.5" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[movie_companies_company_type_id]" ModificationCount="0" SamplingPercent="37.4542" LastUpdate="2021-06-19T02:06:42.68" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Statistics="[movie_companies_movie_id]" ModificationCount="0" SamplingPercent="37.4542" LastUpdate="2021-06-19T02:03:51.47" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Statistics="[cast_info_note]" ModificationCount="0" SamplingPercent="2.71761" LastUpdate="2021-06-19T00:56:56.18" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[role_type]" Statistics="[_WA_Sys_00000001_4316F928]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-15T23:44:40.4" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[company_type]" Statistics="[_WA_Sys_00000001_2E1BDC42]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-06-15T23:44:40.35" />
              <StatisticsInfo Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Statistics="[cast_info_movie_id]" ModificationCount="0" SamplingPercent="2.71761" LastUpdate="2021-06-19T00:56:50.02" />
            </OptimizerStatsUsage>
            <TraceFlags IsCompileTime="true">
              <TraceFlag Value="8017" Scope="Global" />
            </TraceFlags>
            <RelOp AvgRowSize="438" EstimateCPU="1.1E-06" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Aggregate" NodeId="0" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="15.4652">
              <OutputList>
                <ColumnReference Column="Expr1014" />
                <ColumnReference Column="Expr1015" />
              </OutputList>
              <StreamAggregate>
                <DefinedValues>
                  <DefinedValue>
                    <ColumnReference Column="Expr1014" />
                    <ScalarOperator ScalarString="MIN([imdb].[dbo].[char_name].[name] as [chn].[name])">
                      <Aggregate AggType="MIN" Distinct="false">
                        <ScalarOperator>
                          <Identifier>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="name" />
                          </Identifier>
                        </ScalarOperator>
                      </Aggregate>
                    </ScalarOperator>
                  </DefinedValue>
                  <DefinedValue>
                    <ColumnReference Column="Expr1015" />
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
                <RelOp AvgRowSize="438" EstimateCPU="0.00564738" EstimateIO="0.000313" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Inner Join" NodeId="1" Parallel="false" PhysicalOp="Merge Join" EstimatedTotalSubtreeCost="15.4652">
                  <OutputList>
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="name" />
                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                  </OutputList>
                  <Merge ManyToMany="true">
                    <InnerSideJoinColumns>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="id" />
                    </InnerSideJoinColumns>
                    <OuterSideJoinColumns>
                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                    </OuterSideJoinColumns>
                    <Residual>
                      <ScalarOperator ScalarString="[imdb].[dbo].[role_type].[id] as [rt].[id]=[imdb].[dbo].[cast_info].[role_id] as [ci].[role_id]">
                        <Compare CompareOp="EQ">
                          <ScalarOperator>
                            <Identifier>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="id" />
                            </Identifier>
                          </ScalarOperator>
                          <ScalarOperator>
                            <Identifier>
                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                            </Identifier>
                          </ScalarOperator>
                        </Compare>
                      </ScalarOperator>
                    </Residual>
                    <RelOp AvgRowSize="442" EstimateCPU="1.672E-05" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="1" LogicalOp="Inner Join" NodeId="2" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="15.4522">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="name" />
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                      </OutputList>
                      <NestedLoops Optimized="false">
                        <Predicate>
                          <ScalarOperator ScalarString="[imdb].[dbo].[company_type].[id] as [ct].[id]=[imdb].[dbo].[movie_companies].[company_type_id] as [mc].[company_type_id]">
                            <Compare CompareOp="EQ">
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="id" />
                                </Identifier>
                              </ScalarOperator>
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                                </Identifier>
                              </ScalarOperator>
                            </Compare>
                          </ScalarOperator>
                        </Predicate>
                        <RelOp AvgRowSize="446" EstimateCPU="0.000100446" EstimateIO="0.00375375" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Sort" NodeId="3" Parallel="false" PhysicalOp="Sort" EstimatedTotalSubtreeCost="15.4489">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="name" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                          </OutputList>
                          <MemoryFractions Input="0.496243" Output="0.496243" />
                          <Sort Distinct="false">
                            <OrderBy>
                              <OrderByColumn Ascending="true">
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                              </OrderByColumn>
                            </OrderBy>
                            <RelOp AvgRowSize="446" EstimateCPU="0.00243101" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Inner Join" NodeId="4" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="15.445">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="name" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="title" />
                              </OutputList>
                              <MemoryFractions Input="0.00751431" Output="0.00751431" />
                              <Hash BitmapCreator="true">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Column="Opt_Bitmap1138" />
                                  </DefinedValue>
                                </DefinedValues>
                                <HashKeysBuild>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                </HashKeysBuild>
                                <HashKeysProbe>
                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="id" />
                                </HashKeysProbe>
                                <RelOp AvgRowSize="273" EstimateCPU="0.00196225" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="49.6442" LogicalOp="Inner Join" NodeId="5" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="13.7477">
                                  <OutputList>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="name" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                                  </OutputList>
                                  <MemoryFractions Input="0.00703721" Output="0.00703721" />
                                  <Hash BitmapCreator="true">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Column="Opt_Bitmap1113" />
                                      </DefinedValue>
                                    </DefinedValues>
                                    <HashKeysBuild>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="person_role_id" />
                                    </HashKeysBuild>
                                    <HashKeysProbe>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="id" />
                                    </HashKeysProbe>
                                    <ProbeResidual>
                                      <ScalarOperator ScalarString="[imdb].[dbo].[char_name].[id] as [chn].[id]=[imdb].[dbo].[cast_info].[person_role_id] as [ci].[person_role_id]">
                                        <Compare CompareOp="EQ">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="id" />
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="person_role_id" />
                                            </Identifier>
                                          </ScalarOperator>
                                        </Compare>
                                      </ScalarOperator>
                                    </ProbeResidual>
                                    <RelOp AvgRowSize="23" EstimateCPU="0.00711316" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="109.657" LogicalOp="Inner Join" NodeId="6" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="11.1165">
                                      <OutputList>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="person_role_id" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                                      </OutputList>
                                      <MemoryFractions Input="0.00656011" Output="0.00656011" />
                                      <Hash BitmapCreator="true">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Column="Opt_Bitmap1108" />
                                          </DefinedValue>
                                        </DefinedValues>
                                        <HashKeysBuild>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                        </HashKeysBuild>
                                        <HashKeysProbe>
                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="movie_id" />
                                        </HashKeysProbe>
                                        <RelOp AvgRowSize="15" EstimateCPU="0.00357144" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="4463.4" LogicalOp="Inner Join" NodeId="7" Parallel="false" PhysicalOp="Hash Match" EstimatedTotalSubtreeCost="0.75473">
                                          <OutputList>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="movie_id" />
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_type_id" />
                                          </OutputList>
                                          <MemoryFractions Input="0.000954198" Output="0.000954198" />
                                          <Hash BitmapCreator="true">
                                            <DefinedValues>
                                              <DefinedValue>
                                                <ColumnReference Column="Opt_Bitmap1063" />
                                              </DefinedValue>
                                            </DefinedValues>
                                            <HashKeysBuild>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id" />
                                            </HashKeysBuild>
                                            <HashKeysProbe>
                                              <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[movie_companies]" Alias="[mc]" Column="company_id" />
                                            </HashKeysProbe>
                                            <RelOp AvgRowSize="11" EstimateCPU="0.0112799" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="234.269" LogicalOp="Filter" NodeId="8" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.058048">
                                              <OutputList>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="id" />
                                              </OutputList>
                                              <Filter StartupExpression="false">
                                                <RelOp AvgRowSize="18" EstimateCPU="0.0258654" EstimateIO="0.0209028" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="234997" EstimatedRowsRead="234997" LogicalOp="Clustered Index Scan" NodeId="9" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.0467681" TableCardinality="234997">
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
                                                  <ScalarOperator ScalarString="[imdb].[dbo].[company_name].[country_code] as [cn].[country_code]=''[ve]''">
                                                    <Compare CompareOp="EQ">
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_name]" Alias="[cn]" Column="country_code" />
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="''[ve]''" />
                                                      </ScalarOperator>
                                                    </Compare>
                                                  </ScalarOperator>
                                                </Predicate>
                                              </Filter>
                                            </RelOp>
                                            <RelOp AvgRowSize="19" EstimateCPU="0.28702" EstimateIO="0.406088" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="2609.13" EstimatedRowsRead="2609.13" LogicalOp="Clustered Index Scan" NodeId="11" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.693108" TableCardinality="2609130">
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
                                                  <ScalarOperator ScalarString="PROBE([Opt_Bitmap1063],[imdb].[dbo].[movie_companies].[company_id] as [mc].[company_id])">
                                                    <Intrinsic FunctionName="PROBE">
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Column="Opt_Bitmap1063" />
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
                                        <RelOp AvgRowSize="19" EstimateCPU="0.0608905" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="303.427" LogicalOp="Filter" NodeId="12" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="10.3546">
                                          <OutputList>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="movie_id" />
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="person_role_id" />
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                                          </OutputList>
                                          <Filter StartupExpression="false">
                                            <RelOp AvgRowSize="523" EstimateCPU="3.98689" EstimateIO="6.30683" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="362443" EstimatedRowsRead="362443" LogicalOp="Clustered Index Scan" NodeId="13" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="10.2937" TableCardinality="36244300">
                                              <OutputList>
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="movie_id" />
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="person_role_id" />
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="note" />
                                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                                              </OutputList>
                                              <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                                <DefinedValues>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="movie_id" />
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="person_role_id" />
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="note" />
                                                  </DefinedValue>
                                                  <DefinedValue>
                                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="role_id" />
                                                  </DefinedValue>
                                                </DefinedValues>
                                                <Object Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Index="[CCI_cast_info]" Alias="[ci]" IndexKind="Clustered" Storage="ColumnStore" />
                                                <Predicate>
                                                  <ScalarOperator ScalarString="PROBE([Opt_Bitmap1108],[imdb].[dbo].[cast_info].[movie_id] as [ci].[movie_id])">
                                                    <Intrinsic FunctionName="PROBE">
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Column="Opt_Bitmap1108" />
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="movie_id" />
                                                        </Identifier>
                                                      </ScalarOperator>
                                                    </Intrinsic>
                                                  </ScalarOperator>
                                                </Predicate>
                                              </IndexScan>
                                            </RelOp>
                                            <Predicate>
                                              <ScalarOperator ScalarString="[imdb].[dbo].[cast_info].[note] as [ci].[note] like ''%(voice)%'' AND [imdb].[dbo].[cast_info].[note] as [ci].[note] like ''%(uncredited)%''">
                                                <Logical Operation="AND">
                                                  <ScalarOperator>
                                                    <Intrinsic FunctionName="like">
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="note" />
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="''%(voice)%''" />
                                                      </ScalarOperator>
                                                    </Intrinsic>
                                                  </ScalarOperator>
                                                  <ScalarOperator>
                                                    <Intrinsic FunctionName="like">
                                                      <ScalarOperator>
                                                        <Identifier>
                                                          <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[cast_info]" Alias="[ci]" Column="note" />
                                                        </Identifier>
                                                      </ScalarOperator>
                                                      <ScalarOperator>
                                                        <Const ConstValue="''%(uncredited)%''" />
                                                      </ScalarOperator>
                                                    </Intrinsic>
                                                  </ScalarOperator>
                                                </Logical>
                                              </ScalarOperator>
                                            </Predicate>
                                          </Filter>
                                        </RelOp>
                                      </Hash>
                                    </RelOp>
                                    <RelOp AvgRowSize="265" EstimateCPU="0.345453" EstimateIO="2.28387" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="31.4034" EstimatedRowsRead="31.4034" LogicalOp="Clustered Index Scan" NodeId="15" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="2.62932" TableCardinality="3140340">
                                      <OutputList>
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="id" />
                                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="name" />
                                      </OutputList>
                                      <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="id" />
                                          </DefinedValue>
                                          <DefinedValue>
                                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="name" />
                                          </DefinedValue>
                                        </DefinedValues>
                                        <Object Database="[imdb]" Schema="[dbo]" Table="[char_name]" Index="[CCI_char_name]" Alias="[chn]" IndexKind="Clustered" Storage="ColumnStore" />
                                        <Predicate>
                                          <ScalarOperator ScalarString="PROBE([Opt_Bitmap1113],[imdb].[dbo].[char_name].[id] as [chn].[id])">
                                            <Intrinsic FunctionName="PROBE">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="Opt_Bitmap1113" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[char_name]" Alias="[chn]" Column="id" />
                                                </Identifier>
                                              </ScalarOperator>
                                            </Intrinsic>
                                          </ScalarOperator>
                                        </Predicate>
                                      </IndexScan>
                                    </RelOp>
                                  </Hash>
                                </RelOp>
                                <RelOp AvgRowSize="194" EstimateCPU="0.27813" EstimateIO="1.40461" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1.92774" EstimatedRowsRead="252831" LogicalOp="Clustered Index Scan" NodeId="17" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="1.68274" TableCardinality="2528310">
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
                                      <ScalarOperator ScalarString="[imdb].[dbo].[title].[production_year] as [t].[production_year]&gt;(2015) AND PROBE([Opt_Bitmap1138],[imdb].[dbo].[title].[id] as [t].[id])">
                                        <Logical Operation="AND">
                                          <ScalarOperator>
                                            <Compare CompareOp="GT">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[title]" Alias="[t]" Column="production_year" />
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="(2015)" />
                                              </ScalarOperator>
                                            </Compare>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Intrinsic FunctionName="PROBE">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Column="Opt_Bitmap1138" />
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
                          </Sort>
                        </RelOp>
                        <RelOp AvgRowSize="11" EstimateCPU="0.0001614" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="4" EstimatedRowsRead="4" LogicalOp="Clustered Index Scan" NodeId="18" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.0032864" TableCardinality="4">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="id" />
                          </OutputList>
                          <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                            <DefinedValues>
                              <DefinedValue>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[company_type]" Alias="[ct]" Column="id" />
                              </DefinedValue>
                            </DefinedValues>
                            <Object Database="[imdb]" Schema="[dbo]" Table="[company_type]" Index="[CCI_company_type]" Alias="[ct]" IndexKind="Clustered" Storage="ColumnStore" />
                          </IndexScan>
                        </RelOp>
                      </NestedLoops>
                    </RelOp>
                    <RelOp AvgRowSize="11" EstimateCPU="0.000100011" EstimateIO="0.00375375" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Sort" NodeId="19" Parallel="false" PhysicalOp="Sort" EstimatedTotalSubtreeCost="0.00699636">
                      <OutputList>
                        <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="id" />
                      </OutputList>
                      <MemoryFractions Input="0.496243" Output="0.496243" />
                      <Sort Distinct="false">
                        <OrderBy>
                          <OrderByColumn Ascending="true">
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="id" />
                          </OrderByColumn>
                        </OrderBy>
                        <RelOp AvgRowSize="11" EstimateCPU="5.76E-07" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="1" LogicalOp="Filter" NodeId="20" Parallel="false" PhysicalOp="Filter" EstimatedTotalSubtreeCost="0.0031426">
                          <OutputList>
                            <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="id" />
                          </OutputList>
                          <Filter StartupExpression="false">
                            <RelOp AvgRowSize="25" EstimateCPU="1.702E-05" EstimateIO="0.003125" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="12" EstimatedRowsRead="12" LogicalOp="Clustered Index Scan" NodeId="21" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.00314202" TableCardinality="12">
                              <OutputList>
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="id" />
                                <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="role" />
                              </OutputList>
                              <IndexScan Ordered="false" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="ColumnStore">
                                <DefinedValues>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="id" />
                                  </DefinedValue>
                                  <DefinedValue>
                                    <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="role" />
                                  </DefinedValue>
                                </DefinedValues>
                                <Object Database="[imdb]" Schema="[dbo]" Table="[role_type]" Index="[CCI_role_type]" Alias="[rt]" IndexKind="Clustered" Storage="ColumnStore" />
                              </IndexScan>
                            </RelOp>
                            <Predicate>
                              <ScalarOperator ScalarString="[imdb].[dbo].[role_type].[role] as [rt].[role]=''composer''">
                                <Compare CompareOp="EQ">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Database="[imdb]" Schema="[dbo]" Table="[role_type]" Alias="[rt]" Column="role" />
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Const ConstValue="''composer''" />
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                            </Predicate>
                          </Filter>
                        </RelOp>
                      </Sort>
                    </RelOp>
                  </Merge>
                </RelOp>
              </StreamAggregate>
            </RelOp>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
  </BatchSequence>
</ShowPlanXML>')