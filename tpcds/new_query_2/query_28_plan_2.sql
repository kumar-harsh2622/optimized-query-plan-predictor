
SELECT dt.d_year, 
               item.i_brand_id          brand_id, 
               item.i_brand             brand, 
               Sum(ss_ext_discount_amt) sum_agg 
FROM   tpcds.dbo.date_dim dt, 
       tpcds.dbo.store_sales, 
       tpcds.dbo.item 
WHERE  dt.d_date_sk = store_sales.ss_sold_date_sk 
       AND store_sales.ss_item_sk = item.i_item_sk 
       AND item.i_manufact_id = 205
       AND dt.d_moy = 1
GROUP  BY dt.d_year, 
          item.i_brand, 
          item.i_brand_id 
ORDER  BY dt.d_year, 
          sum_agg DESC, 
          brand_id
OPTION( USE PLAN N'<ShowPlanXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/sqlserver/2004/07/showplan" Version="1.539" Build="15.0.2080.9">
  <BatchSequence>
    <Batch>
      <Statements>
        <StmtSimple StatementCompId="1" StatementEstRows="162.878" StatementId="1" StatementOptmLevel="FULL" CardinalityEstimationModelVersion="150" StatementSubTreeCost="1.48983" StatementText="&#13;&#10;SELECT dt.d_year, &#13;&#10;               item.i_brand_id          brand_id, &#13;&#10;               item.i_brand             brand, &#13;&#10;               Sum(ss_ext_discount_amt) sum_agg &#13;&#10;FROM   tpcds.dbo.date_dim dt, &#13;&#10;       tpcds.dbo.store_sales, &#13;&#10;       tpcds.dbo.item &#13;&#10;WHERE  dt.d_date_sk = store_sales.ss_sold_date_sk &#13;&#10;       AND store_sales.ss_item_sk = item.i_item_sk &#13;&#10;       AND item.i_manufact_id = 205&#13;&#10;       AND dt.d_moy = 1&#13;&#10;GROUP  BY dt.d_year, &#13;&#10;          item.i_brand, &#13;&#10;          item.i_brand_id &#13;&#10;ORDER  BY dt.d_year, &#13;&#10;          sum_agg DESC, &#13;&#10;          brand_id" StatementType="SELECT" QueryHash="0x927CF3BD89C7DE22" QueryPlanHash="0x8657150F30F241DF" RetrievedFromCache="false" SecurityPolicyApplied="false">
          <StatementSetOptions ANSI_NULLS="true" ANSI_PADDING="true" ANSI_WARNINGS="true" ARITHABORT="true" CONCAT_NULL_YIELDS_NULL="true" NUMERIC_ROUNDABORT="false" QUOTED_IDENTIFIER="true"/>
          <QueryPlan CachedPlanSize="56" CompileTime="9" CompileCPU="9" CompileMemory="1056">
            <MissingIndexes>
              <MissingIndexGroup Impact="61.8817">
                <MissingIndex Database="[tpcds]" Schema="[dbo]" Table="[item]">
                  <ColumnGroup Usage="EQUALITY">
                    <Column Name="[i_manufact_id]" ColumnId="14"/>
                  </ColumnGroup>
                </MissingIndex>
              </MissingIndexGroup>
            </MissingIndexes>
            <MemoryGrantInfo SerialRequiredMemory="664" SerialDesiredMemory="67280" GrantedMemory="0" MaxUsedMemory="0"/>
            <OptimizerHardwareDependentProperties EstimatedAvailableMemoryGrant="103769" EstimatedPagesCached="51884" EstimatedAvailableDegreeOfParallelism="4" MaxCompileMemory="2520288"/>
            <OptimizerStatsUsage>
              <StatisticsInfo Database="[tpcds]" Schema="[dbo]" Table="[item]" Statistics="[_WA_Sys_0000000E_32E0915F]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-08-06T22:34:55.43"/>
              <StatisticsInfo Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Statistics="[PK__date_dim__06A4A8B0F2954F6E]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-08-06T20:55:00.68"/>
              <StatisticsInfo Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Statistics="[_WA_Sys_00000009_276EDEB3]" ModificationCount="0" SamplingPercent="71.6779" LastUpdate="2021-08-06T22:34:55.38"/>
              <StatisticsInfo Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Statistics="[PK__store_sa__89D185EE7FE81131]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-08-06T20:58:47.41"/>
              <StatisticsInfo Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Statistics="[_WA_Sys_00000001_4F7CD00D]" ModificationCount="0" SamplingPercent="3.6297" LastUpdate="2021-08-06T21:08:26.19"/>
              <StatisticsInfo Database="[tpcds]" Schema="[dbo]" Table="[item]" Statistics="[_WA_Sys_00000009_32E0915F]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-08-06T22:34:55.51"/>
              <StatisticsInfo Database="[tpcds]" Schema="[dbo]" Table="[item]" Statistics="[_WA_Sys_00000008_32E0915F]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-08-06T22:34:55.46"/>
              <StatisticsInfo Database="[tpcds]" Schema="[dbo]" Table="[item]" Statistics="[PK__item__2716E44CFF0CB01C]" ModificationCount="0" SamplingPercent="100" LastUpdate="2021-08-06T20:56:12.25"/>
              <StatisticsInfo Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Statistics="[_WA_Sys_00000007_276EDEB3]" ModificationCount="0" SamplingPercent="71.6779" LastUpdate="2021-08-06T21:08:26.14"/>
            </OptimizerStatsUsage>
            <RelOp AvgRowSize="90" EstimateCPU="0.00103357" EstimateIO="0.00375375" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Batch" EstimateRows="162.878" LogicalOp="Sort" NodeId="0" Parallel="false" PhysicalOp="Sort" EstimatedTotalSubtreeCost="1.48983">
              <OutputList>
                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                <ColumnReference Column="Expr1005"/>
              </OutputList>
              <MemoryFractions Input="0.999279" Output="0.999279"/>
              <Sort Distinct="false">
                <OrderBy>
                  <OrderByColumn Ascending="true">
                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                  </OrderByColumn>
                  <OrderByColumn Ascending="false">
                    <ColumnReference Column="Expr1005"/>
                  </OrderByColumn>
                  <OrderByColumn Ascending="true">
                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                  </OrderByColumn>
                </OrderBy>
                <RelOp AvgRowSize="90" EstimateCPU="0" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="162.878" LogicalOp="Compute Scalar" NodeId="1" Parallel="false" PhysicalOp="Compute Scalar" EstimatedTotalSubtreeCost="1.48491">
                  <OutputList>
                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                    <ColumnReference Column="Expr1005"/>
                  </OutputList>
                  <ComputeScalar>
                    <DefinedValues>
                      <DefinedValue>
                        <ColumnReference Column="Expr1005"/>
                        <ScalarOperator ScalarString="CASE WHEN [Expr1016]=(0) THEN NULL ELSE [Expr1017] END">
                          <IF>
                            <Condition>
                              <ScalarOperator>
                                <Compare CompareOp="EQ">
                                  <ScalarOperator>
                                    <Identifier>
                                      <ColumnReference Column="Expr1016"/>
                                    </Identifier>
                                  </ScalarOperator>
                                  <ScalarOperator>
                                    <Const ConstValue="(0)"/>
                                  </ScalarOperator>
                                </Compare>
                              </ScalarOperator>
                            </Condition>
                            <Then>
                              <ScalarOperator>
                                <Const ConstValue="NULL"/>
                              </ScalarOperator>
                            </Then>
                            <Else>
                              <ScalarOperator>
                                <Identifier>
                                  <ColumnReference Column="Expr1017"/>
                                </Identifier>
                              </ScalarOperator>
                            </Else>
                          </IF>
                        </ScalarOperator>
                      </DefinedValue>
                    </DefinedValues>
                    <RelOp AvgRowSize="90" EstimateCPU="0.000183814" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="162.878" LogicalOp="Aggregate" NodeId="2" Parallel="false" PhysicalOp="Stream Aggregate" EstimatedTotalSubtreeCost="1.48491">
                      <OutputList>
                        <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                        <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                        <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                        <ColumnReference Column="Expr1016"/>
                        <ColumnReference Column="Expr1017"/>
                      </OutputList>
                      <StreamAggregate>
                        <DefinedValues>
                          <DefinedValue>
                            <ColumnReference Column="Expr1016"/>
                            <ScalarOperator ScalarString="COUNT_BIG([tpcds].[dbo].[store_sales].[ss_ext_discount_amt])">
                              <Aggregate AggType="COUNT_BIG" Distinct="false">
                                <ScalarOperator>
                                  <Identifier>
                                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_ext_discount_amt"/>
                                  </Identifier>
                                </ScalarOperator>
                              </Aggregate>
                            </ScalarOperator>
                          </DefinedValue>
                          <DefinedValue>
                            <ColumnReference Column="Expr1017"/>
                            <ScalarOperator ScalarString="SUM([tpcds].[dbo].[store_sales].[ss_ext_discount_amt])">
                              <Aggregate AggType="SUM" Distinct="false">
                                <ScalarOperator>
                                  <Identifier>
                                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_ext_discount_amt"/>
                                  </Identifier>
                                </ScalarOperator>
                              </Aggregate>
                            </ScalarOperator>
                          </DefinedValue>
                        </DefinedValues>
                        <GroupBy>
                          <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                          <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                          <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                        </GroupBy>
                        <RelOp AvgRowSize="78" EstimateCPU="0.00207367" EstimateIO="0.0112613" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="170.624" LogicalOp="Sort" NodeId="3" Parallel="false" PhysicalOp="Sort" EstimatedTotalSubtreeCost="1.48473">
                          <OutputList>
                            <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                            <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_ext_discount_amt"/>
                            <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                            <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                          </OutputList>
                          <MemoryFractions Input="0.000720548" Output="0.000720548"/>
                          <Sort Distinct="false">
                            <OrderBy>
                              <OrderByColumn Ascending="true">
                                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                              </OrderByColumn>
                              <OrderByColumn Ascending="true">
                                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                              </OrderByColumn>
                              <OrderByColumn Ascending="true">
                                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                              </OrderByColumn>
                            </OrderBy>
                            <RelOp AvgRowSize="78" EstimateCPU="0.00869562" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="170.624" LogicalOp="Inner Join" NodeId="4" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="1.47139">
                              <OutputList>
                                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_ext_discount_amt"/>
                                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                                <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                              </OutputList>
                              <NestedLoops Optimized="false" WithUnorderedPrefetch="true">
                                <OuterReferences>
                                  <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_sold_date_sk"/>
                                  <ColumnReference Column="Expr1015"/>
                                </OuterReferences>
                                <RelOp AvgRowSize="78" EstimateCPU="0.00869562" EstimateIO="0" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="2080.29" LogicalOp="Inner Join" NodeId="6" Parallel="false" PhysicalOp="Nested Loops" EstimatedTotalSubtreeCost="1.00298">
                                  <OutputList>
                                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_sold_date_sk"/>
                                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_ext_discount_amt"/>
                                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                                  </OutputList>
                                  <NestedLoops Optimized="false">
                                    <OuterReferences>
                                      <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_item_sk"/>
                                    </OuterReferences>
                                    <RelOp AvgRowSize="81" EstimateCPU="0.019957" EstimateIO="0.897199" EstimateRebinds="0" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="13" EstimatedRowsRead="18000" LogicalOp="Clustered Index Scan" NodeId="7" Parallel="false" PhysicalOp="Clustered Index Scan" EstimatedTotalSubtreeCost="0.917156" TableCardinality="18000">
                                      <OutputList>
                                        <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_item_sk"/>
                                        <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                                        <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                                      </OutputList>
                                      <IndexScan Ordered="false" ForcedIndex="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_item_sk"/>
                                          </DefinedValue>
                                          <DefinedValue>
                                            <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand_id"/>
                                          </DefinedValue>
                                          <DefinedValue>
                                            <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_brand"/>
                                          </DefinedValue>
                                        </DefinedValues>
                                        <Object Database="[tpcds]" Schema="[dbo]" Table="[item]" Index="[PK__item__2716E44CFF0CB01C]" IndexKind="Clustered" Storage="RowStore"/>
                                        <Predicate>
                                          <ScalarOperator ScalarString="[tpcds].[dbo].[item].[i_manufact_id]=(205)">
                                            <Compare CompareOp="EQ">
                                              <ScalarOperator>
                                                <Identifier>
                                                  <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_manufact_id"/>
                                                </Identifier>
                                              </ScalarOperator>
                                              <ScalarOperator>
                                                <Const ConstValue="(205)"/>
                                              </ScalarOperator>
                                            </Compare>
                                          </ScalarOperator>
                                        </Predicate>
                                      </IndexScan>
                                    </RelOp>
                                    <RelOp AvgRowSize="20" EstimateCPU="0.000333025" EstimateIO="0.00534722" EstimateRebinds="12" EstimateRewinds="0" EstimatedExecutionMode="Row" EstimateRows="160.022" EstimatedRowsRead="160.022" LogicalOp="Clustered Index Seek" NodeId="8" Parallel="false" PhysicalOp="Clustered Index Seek" EstimatedTotalSubtreeCost="0.0684899" TableCardinality="2880400">
                                      <OutputList>
                                        <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_sold_date_sk"/>
                                        <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_ext_discount_amt"/>
                                      </OutputList>
                                      <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                        <DefinedValues>
                                          <DefinedValue>
                                            <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_sold_date_sk"/>
                                          </DefinedValue>
                                          <DefinedValue>
                                            <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_ext_discount_amt"/>
                                          </DefinedValue>
                                        </DefinedValues>
                                        <Object Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Index="[PK__store_sa__89D185EE7FE81131]" IndexKind="Clustered" Storage="RowStore"/>
                                        <SeekPredicates>
                                          <SeekPredicateNew>
                                            <SeekKeys>
                                              <Prefix ScanType="EQ">
                                                <RangeColumns>
                                                  <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_item_sk"/>
                                                </RangeColumns>
                                                <RangeExpressions>
                                                  <ScalarOperator ScalarString="[tpcds].[dbo].[item].[i_item_sk]">
                                                    <Identifier>
                                                      <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[item]" Column="i_item_sk"/>
                                                    </Identifier>
                                                  </ScalarOperator>
                                                </RangeExpressions>
                                              </Prefix>
                                            </SeekKeys>
                                          </SeekPredicateNew>
                                        </SeekPredicates>
                                      </IndexScan>
                                    </RelOp>
                                  </NestedLoops>
                                </RelOp>
                                <RelOp AvgRowSize="23" EstimateCPU="0.0001581" EstimateIO="0.003125" EstimateRebinds="2074.07" EstimateRewinds="5.21863" EstimatedExecutionMode="Row" EstimateRows="1" EstimatedRowsRead="1" LogicalOp="Clustered Index Seek" NodeId="9" Parallel="false" PhysicalOp="Clustered Index Seek" EstimatedTotalSubtreeCost="0.458715" TableCardinality="73049">
                                  <OutputList>
                                    <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                                  </OutputList>
                                  <IndexScan Ordered="true" ScanDirection="FORWARD" ForcedIndex="false" ForceSeek="false" ForceScan="false" NoExpandHint="false" Storage="RowStore">
                                    <DefinedValues>
                                      <DefinedValue>
                                        <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_year"/>
                                      </DefinedValue>
                                    </DefinedValues>
                                    <Object Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Index="[PK__date_dim__06A4A8B0F2954F6E]" Alias="[dt]" IndexKind="Clustered" Storage="RowStore"/>
                                    <SeekPredicates>
                                      <SeekPredicateNew>
                                        <SeekKeys>
                                          <Prefix ScanType="EQ">
                                            <RangeColumns>
                                              <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_date_sk"/>
                                            </RangeColumns>
                                            <RangeExpressions>
                                              <ScalarOperator ScalarString="[tpcds].[dbo].[store_sales].[ss_sold_date_sk]">
                                                <Identifier>
                                                  <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[store_sales]" Column="ss_sold_date_sk"/>
                                                </Identifier>
                                              </ScalarOperator>
                                            </RangeExpressions>
                                          </Prefix>
                                        </SeekKeys>
                                      </SeekPredicateNew>
                                    </SeekPredicates>
                                    <Predicate>
                                      <ScalarOperator ScalarString="[tpcds].[dbo].[date_dim].[d_moy] as [dt].[d_moy]=(1)">
                                        <Compare CompareOp="EQ">
                                          <ScalarOperator>
                                            <Identifier>
                                              <ColumnReference Database="[tpcds]" Schema="[dbo]" Table="[date_dim]" Alias="[dt]" Column="d_moy"/>
                                            </Identifier>
                                          </ScalarOperator>
                                          <ScalarOperator>
                                            <Const ConstValue="(1)"/>
                                          </ScalarOperator>
                                        </Compare>
                                      </ScalarOperator>
                                    </Predicate>
                                  </IndexScan>
                                </RelOp>
                              </NestedLoops>
                            </RelOp>
                          </Sort>
                        </RelOp>
                      </StreamAggregate>
                    </RelOp>
                  </ComputeScalar>
                </RelOp>
              </Sort>
            </RelOp>
          </QueryPlan>
        </StmtSimple>
      </Statements>
    </Batch>
  </BatchSequence>
</ShowPlanXML>')