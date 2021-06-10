abstract class ContactUsEvent {
  const ContactUsEvent();
}

class ContactUsPageRequested extends ContactUsEvent {}

class ContactUsDataRequested extends ContactUsEvent {}
