randpoints(random::Function, num::Integer) = [(random(),random()) for _ in 1:num]

# using Plots
# points = randpoints(rand, 20)
# Plotsscatter(points; legend = false)
# здесь все как пример тк точки графика строястя автоматически, но задача есть задача