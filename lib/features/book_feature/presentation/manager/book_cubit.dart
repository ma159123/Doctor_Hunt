import 'package:doctor_hunt/features/book_feature/data/models/apointment_model/apointment_model.dart';
import 'package:doctor_hunt/features/book_feature/data/models/available_appointments.dart';
import 'package:doctor_hunt/features/book_feature/data/models/get_appointments_model/get_appointments_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/appointment_repo.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  final AppointmentRepository _appointmentRepository;

  BookCubit({
    required AppointmentRepository appointmentRepository,
  })  : _appointmentRepository = appointmentRepository,
        super(InitialBookState());

  static BookCubit get(context) => BlocProvider.of(context);

  AppointmentModel appointmentModel = const AppointmentModel();

  Future<void> createAppointment({
    required DateTime date,
    required String doctorID,
    required String patientID,
    required String state,
    required String online,
    required String cost,
    required String notes,
  }) async {
    emit(CreateAppointmentLoadingState());
    final response = await _appointmentRepository.createAppointment(
        date: date,
        doctorID: doctorID,
        patientID: patientID,
        state: state,
        online: online,
        cost: cost,
        notes: notes);
    response.fold((failure) {
      print(' create appointment error: $failure');
      emit(CreateAppointmentErrorState(failure.toString()));
    }, (success) {
      appointmentModel = success;
      print(' create appointment success: $appointmentModel');
      emit(CreateAppointmentSuccessState(success));
    });
  }

  GetAppointmentsModel getAppointmentsModel = const GetAppointmentsModel();
  Future<void> getPatientAppointments({
    required String patientID,
  }) async {
    emit(GetAppointmentsLoadingState());
    final response = await _appointmentRepository.getPatientAppointments(
        patientID: patientID);

    response.fold((failure) {
      print(' create appointment error: $failure');
      emit(GetAppointmentsErrorState(failure.toString()));
    }, (success) {
      getAppointmentsModel = success;
      print(' create appointment success: $appointmentModel');
      emit(GetAppointmentsSuccessState(success));
    });
  }

  AvailableAppointments availableAppointments= const AvailableAppointments();

  Future<void> getAvailableAppointmentsForDoctor({
    required String doctorID,
  }) async {
    emit(GetAvailableAppointmentsLoadingState());
    final response = await _appointmentRepository.getAvailableAppointmentsForDoctor(
        doctorID: doctorID);

    response.fold((failure) {
      print(' get Available appointment error: $failure');
      emit(GetAvailableAppointmentsErrorState(failure.toString()));
    }, (success) {
      availableAppointments = success;
      print('get Available appointment success: $availableAppointments');
      emit(GetAvailableAppointmentsSuccessState(success));
    });
  }
}
