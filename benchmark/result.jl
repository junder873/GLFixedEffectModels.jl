using DataFrames, CSV, Gadflydf = CSV.read("/Users/Matthieu/Dropbox/Github/FixedEffectModels.jl/benchmark/benchmark.csv")df.R = df.R ./ df.Juliadf.Stata = df.Stata ./ df.Juliadf.Julia = df.Julia ./ df.Juliamdf = melt(df[!, [:Command, :Julia, :R, :Stata]], :Command)mdf = rename(mdf, :variable => :Language)p = plot(mdf, x = "Language", y = "value", color = "Command", Guide.ylabel("Time (Ratio to Julia)"), Guide.xlabel("Model"), Guide.yticks(ticks= [1, 5, 10, 15]))draw(PNG("/Users/Matthieu/Dropbox/Github/FixedEffectModels.jl/benchmark/fixedeffectmodels_benchmark.png", 8inch, 5inch, dpi=300), p)