import 'package:feetly/views/video_view.dart';
import 'package:flutter/material.dart';

class ExercisesView extends StatelessWidget {
  ExercisesView({super.key});

  final List<Exercise> excercisesList = [
    Exercise(
      name: "Calf raises",
      description:
          "Builds arch-supporting strength for better stability and a powerful stride.",
      thumbnailPath: "assets/thumbnails/calfRaise.jpg",
      videoPath: "assets/videos/calfRaises.mp4",
      targetMuscles: ["Gastrocnemius", "Soleus"],
      details:
          "This exercise directly builds your foundation. Stronger calves provide essential support for your arches, improving stability and creating a more powerful push-off with every step you take. This can help reduce fatigue and strain on the flattened arch",
    ),
    Exercise(
      name: "Heel Stretches",
      description:
          "Releases tight calves to improve ankle mobility and reduce strain on the arch.",
      thumbnailPath: "assets/thumbnails/heelStretch.jpg",
      videoPath: "assets/videos/heelStretches.mp4",
      targetMuscles: ["Gastrocnemius"],
      details:
          "Tight calves can worsen flat feet by limiting ankle mobility. This stretch releases that tension, allowing for a better range of motion in your ankle. This helps your foot strike the ground more correctly when you walk or run, easing stress on the arch.",
    ),
    Exercise(
      name: "Single Leg Glute Bridge",
      description:
          "Strengthens glutes to stabilize hips and prevent knees from collapsing inward.",
      thumbnailPath: "assets/thumbnails/gluteBridge.jpg",
      videoPath: "assets/videos/gluteBridge.mp4",
      targetMuscles: ["Gluteus Maximus", "Hamstrings"],
      details:
          "This move targets your powerhouse—your glutes. Strong glutes are critical because they prevent your knees from collapsing inward, a common issue with flat feet that leads to pain. By stabilizing your hips, this exercise ensures your entire leg, including your foot and arch, is properly aligned.",
    ),
    Exercise(
      name: "Single Leg Stance",
      description:
          "Trains your feet's stabilizer muscles to actively prevent the arch from collapsing.",
      thumbnailPath: "assets/thumbnails/singleLegStance.jpg",
      videoPath: "assets/videos/singleLegStance.mp4",
      targetMuscles: ["Gluteus Maximus", "Hamstrings"],
      details:
          "This is your body's balance master. It actively trains the tiny stabilizer muscles in your feet, ankles, and legs to work together and prevent your arch from over-collapsing. Improved balance here translates to better alignment and control in all your daily movements.",
    ),
    Exercise(
      name: "Body Weight Squats",
      description:
          "Reinforces proper knee-and-ankle alignment during functional movement.",
      thumbnailPath: "assets/thumbnails/squat.jpg",
      videoPath: "assets/videos/squat.mp4",
      targetMuscles: ["Gluteus Maximus", "Hamstrings"],
      details:
          "Squats reinforce proper movement patterns for your entire lower body. They teach you to keep your knees aligned over your ankles, which corrects the inward knee drift associated with flat feet. This builds functional strength that protects your feet, knees, and hips during any activity.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "Excercises",
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Container(color: theme.colorScheme.primary),
          ),
          pinned: true,
          backgroundColor: theme.colorScheme.primary,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsGeometry.all(25),
            child: Center(
              child: Text(
                "Let's get those feet arched !!",
                style: theme.textTheme.headlineSmall!.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _excerciseBuilder(context, theme, excercisesList[index]);
          }, childCount: excercisesList.length),
        ),
      ],
    );
  }

  Widget _excerciseBuilder(
    BuildContext context,
    ThemeData theme,
    Exercise exercise,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      color: theme.colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.name,
              style: theme.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            Divider(
              color: theme.colorScheme.onSurface.withAlpha(100),
              height: 24,
              thickness: 2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(exercise.thumbnailPath),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Why do it?",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        exercise.description,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: theme.colorScheme.onSurface.withAlpha(100),
              height: 24,
              thickness: 2,
            ),
            Text(
              "Target muscle groups: ",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...exercise.targetMuscles.map((String muscle) {
              return Text(
                "• $muscle",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              );
            }).toList(),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return VideoView(exercise: exercise);
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  foregroundColor: theme.colorScheme.onPrimaryContainer,
                ),
                child: Text("Excercise video & trainer"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercise {
  final String name;
  final String description;
  final String thumbnailPath;
  final String videoPath;
  final List<String> targetMuscles;
  final String details;

  Exercise({
    required this.name,
    required this.description,
    required this.thumbnailPath,
    required this.videoPath,
    required this.targetMuscles,
    required this.details,
  });
}
