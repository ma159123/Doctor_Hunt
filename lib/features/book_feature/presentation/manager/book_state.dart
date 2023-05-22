import 'package:doctor_hunt/features/book_feature/data/models/apointment_model/apointment_model.dart';
import 'package:doctor_hunt/features/book_feature/data/models/available_appointments.dart';
import 'package:doctor_hunt/features/book_feature/data/models/get_patient_appointments/get_patient_appointments.dart';

abstract class BookState {}

class InitialBookState extends BookState {}

class CreateAppointmentLoadingState extends BookState {}

class CreateAppointmentSuccessState extends BookState {
  AppointmentModel appointmentModel;
  CreateAppointmentSuccessState(this.appointmentModel);
}

class CreateAppointmentErrorState extends BookState {
  String error;
  CreateAppointmentErrorState(this.error);
}

class GetAppointmentsLoadingState extends BookState {}

class GetAppointmentsSuccessState extends BookState {
  GetPatientAppointments getPatientAppointments;
  GetAppointmentsSuccessState(this.getPatientAppointments);
}

class GetAppointmentsErrorState extends BookState {
  String error;
  GetAppointmentsErrorState(this.error);
}

class GetAvailableAppointmentsLoadingState extends BookState {}

class GetAvailableAppointmentsSuccessState extends BookState {
  AvailableAppointments availableAppointments;
  GetAvailableAppointmentsSuccessState(this.availableAppointments);
}

class GetAvailableAppointmentsErrorState extends BookState {
  String error;
  GetAvailableAppointmentsErrorState(this.error);
}
