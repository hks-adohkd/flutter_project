abstract class ProfileEvent {
  const ProfileEvent();
}

class ProfilePageRequested extends ProfileEvent {}

class ProfileDataRequested extends ProfileEvent {}
