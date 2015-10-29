[Mesh]
  file = mug.e
[]

[Variables]
  active = 'convected'

  [./convected]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  active = 'diff conv'

  [./diff]
    type = Diffusion
    variable = convected
  [../]

  [./conv]
    type = ExampleConvection
    variable = convected
    velocity = '0.0 0.0 1.0'
  [../]
[]

[BCs]
  active = 'bottom top'

  [./bottom]
    type = DirichletBC
    variable = convected
    boundary = 'bottom'
    value = 1
  [../]

  [./top]
    type = DirichletBC
    variable = convected
    boundary = 'top'
    value = 0
  [../]
[]

[Executioner]
  type = Steady
  solve_type = 'PJFNK'
[]

[Outputs]
  exodus = true
[]
