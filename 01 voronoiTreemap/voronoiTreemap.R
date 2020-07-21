library(voronoiTreemap)
data("ExampleGDP")
gdp_json <- vt_export_json(vt_input_from_df(ExampleGDP))
vt_d3(gdp_json)
