# -数学建模

+ 随着城市化进程的推进，人造光被广泛应用于城市各处，人造光的过度使用也对环境与人类健康安全造成重大影响，如何制定有效的干预策略以减轻光污染已迫在眉睫。
本文基于熵权法-topsis算法构建了影响光污染的综合评价指标体系，深入研究了光污染风险水平等级，并提出了有效的干预策略。

+ 对于问题一，首先，我们通过主成分分析对所获取到的中国31个地区的27个指标数据进行降维处理，得到4个一级指标与27个二级指标，随后，通过利用熵权法-
topsis算法，得出权重最高的指标为林业用地面积（平方公里），光污染风险水平最高（综合得分最高）的地区为上海，并构建了光污染风险水平等级体系，其中
共有10个地区为高污染风险地区，10个地区为中污染风险地区，11个地区为低污染风险地区。

+ 对于问题二，根据问题一中所得光污染风险水平等级体系，选取延庆区、门头沟区、顺义区和海淀区分别作为受保护地区、农村地区、郊区地区和城市地区进行分析。

+ 以GDP总量、森林覆盖量、人口总量作为判别指标，通过判别分析得到延庆区为低污染风险区，门头沟区和顺义区分别为中污染风险区，海淀区为高污染风险区，
说明光污染受发展水平、人口及生物多样性的影响。
对于问题三，首先，我们根据问题一中所得指标权重，确定可能干预策略为城乡一体化策略，植树造林策略，节能环保策略。随后，假设实施策略后相关指标人口，森林覆盖率、
GDP增加/减少20%，根据问题一模型得出城市平均得分由0.3208减少至0.3190，故可知干预策略有效。

+ 对于问题四，我们分别选取植物覆盖率小的上海与城市人口占比大的四川作为分析地区，
根据问题一指标权值与模型，通过控制变量的方法对每个指标增加/减少30%，分别求得共同影响上海与四川的光污染综合得分最大的指标为城市绿化面积，故植树造林策略对每个地区最有效。
最后，我们对模型进行了优化，在结尾提出了模型的优缺点。

![image](https://user-images.githubusercontent.com/83958152/226164186-d3fe61ef-5a9f-46c4-ac12-73b4206b4156.png)

## 摘要

###  &emsp;&emsp; With the advancement of urbanization, artiffcial light is widely used everywhere in cities, and
### the negative effects caused by it also make people feel worried. Therefore, it is urgent to develop
### effective intervention strategies to reduce light pollution.
### For the ffrst problem, this paper uses principal component analysis to reduce the dimension of
### the 27 index data from 31 regions in China, and obtains 4 ffrst-level indicators and 27 second-level
### indicators. Using the entropy weight method - topsis algorithm, it is concluded that the index with
### the highest weight is the area of forestry land (square kilometers), and the area with the highest
### level of light pollution risk is Shanghai. A hierarchy of light pollution risk level is constructed,
### including 10 areas with high pollution risk, 10 areas with medium pollution risk, and 11 areas with
### low pollution risk.
### &emsp;&emsp;For the second question, four different types of areas in Beijing, Yanqing District, Mentougou
### District, Shunyi District and Haidian District, are selected for analysis. Taking the total GDP, forest
### coverage and total population as the discriminant indicators, Yanqing District is a low pollution risk
### area, Mentougou District and Shunyi District are medium pollution risk areas, and Haidian District
### is a high pollution risk area through discriminant analysis, indicating that light pollution is affected
### by the development level, population and natural environment.
### For question 3, according to the index weight obtained in question 1, the possible intervention
### strategies are determined as urban-rural integration strategy, afforestation strategy, energy conservation
### and environmental protection strategy. Assuming that the population, forest coverage and
### GDP of the relevant indicators after the implementation of the strategy increase/decrease by 20%,
### the average score of the city is reduced from 0.3208 to 0.3190 according to the model in question
### 1, it can be seen that the intervention strategy is effective.
###  &emsp;&emsp; For question 4, select Shanghai with low plant coverage and Sichuan with a large proportion
### of urban population as the analysis area. According to the index weight and model of question
### 1, increase/decrease each index by 30% through the method of control variables, and respectively
### obtain that the index with the largest comprehensive score of light pollution that jointly affects
### Shanghai and Sichuan is the urban green area, so the afforestation strategy is the most effective for
### each area.
### &emsp;&emsp;Finally, we optimize the model and put forward the advantages and disadvantages of the model
### at the end.


## Key word: Principal Component Analysis Entropy Method, Topsis, Discriminant Analysis
