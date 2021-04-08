#  App Architecture guidelines

## Services

- Services should be smart
- Should provide interface using Publishers
- Can wrap existing/legacy closure APIs into Publishers

## Views

- Make views as dumb as possible, their job is to display a view model
- View model for every view (exception for component views that display only primitives)
- Any user interaction should be communicated to view model

## View Models

- ObservableObjects
- Private(set) all Publishers
- Any data updates happen via passed in publishers
- Contain sources of truth (beware of multiple SOT). Sometimes requires work to propogate the truth up and down in the app
- Handle UI actions from View
- May need to pass publishers down to child view models or between view models

## Controllers

- Glue between services & view models
- Should handle routing between app features
