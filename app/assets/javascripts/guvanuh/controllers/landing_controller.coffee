@Guvanuh.controller 'LandingController',
['$scope', '$resource'
 ($scope, $resource) ->
  ActSummaries = $resource('act_summaries.json')
  $scope.actSummaries = ActSummaries.query()
]