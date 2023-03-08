# Optional flat/non-resource MVC folder structure
push!(LOAD_PATH,  "controllers", "views", "views/layouts", "models")

using Unitful, NLsolve, TermoQuimica, Plots, PyCall
plotlyjs()


ff = pyimport("plotly.figure_factory")
go = pyimport("plotly.graph_objects")
np = pyimport("numpy")
kd = pyimport("plotly.io")
kd.renderers.default="browser"