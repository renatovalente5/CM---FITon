import 'package:postos_locais/core.dart';

class ExerciseService {
  List<Exercise> getExercises() {
    return <Exercise>[
      Exercise(
        title: "Dribble Exercises",
        image: "assets/images/black/16.jpg",
        description:
            "You should always try to work out at least three times, spaced out across the week,  so you can get the maximum benefits. Therefore, anywhere from three to six workouts is ideal. I like to do six workouts a week on Monday through Saturday, with a rest day on Sunday. REST: Second of all, don't forget the rest day.",
        price: 5.0,
        rating: 5.0,
        moves: 17,
        sets: 12,
        minutes: 30,
        duration: 3,
      ),
      Exercise(
        title: "Combine Exercises",
        image: "assets/images/black/12.jpg",
        description:
            "You should always try to work out at least three times, spaced out across the week,  so you can get the maximum benefits. Therefore, anywhere from three to six workouts is ideal. I like to do six workouts a week on Monday through Saturday, with a rest day on Sunday. REST: Second of all, don't forget the rest day.",
        price: 3.5,
        rating: 4.0,
        moves: 8,
        sets: 10,
        minutes: 17,
        duration: 2,
      ),
      Exercise(
        title: "Push-Up Exercises",
        image: "assets/images/black/1.jpg",
        description:
            "You should always try to work out at least three times, spaced out across the week,  so you can get the maximum benefits. Therefore, anywhere from three to six workouts is ideal. I like to do six workouts a week on Monday through Saturday, with a rest day on Sunday. REST: Second of all, don't forget the rest day.",
        price: 7.0,
        rating: 4.4,
        moves: 20,
        sets: 17,
        minutes: 45,
        duration: 4,
      ),
      Exercise(
        title: "Burble-Up Exercises",
        image: "assets/images/6.jpg",
        description:
            "You should always try to work out at least three times, spaced out across the week,  so you can get the maximum benefits. Therefore, anywhere from three to six workouts is ideal. I like to do six workouts a week on Monday through Saturday, with a rest day on Sunday. REST: Second of all, don't forget the rest day.",
        price: 4.0,
        rating: 4.7,
        moves: 10,
        sets: 9,
        minutes: 22,
        duration: 2,
      ),
    ];
  }
}
