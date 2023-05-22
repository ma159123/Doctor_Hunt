import 'package:doctor_hunt/features/book_feature/data/models/apointment_model/apointment_model.dart';
import 'package:doctor_hunt/features/book_feature/data/models/available_appointments.dart';
import 'package:doctor_hunt/features/book_feature/data/models/get_appointments_model/get_appointments_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
    required String date,
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
      emit(CreateAppointmentErrorState(failure.error));
    }, (success) {
      appointmentModel = success;
      print(' create appointment success: ${appointmentModel.success}');
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
      emit(GetAppointmentsErrorState(failure.error));
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
      emit(GetAvailableAppointmentsErrorState(failure.error));
    }, (success) {
      availableAppointments = success;
      print('get Available appointment success: $availableAppointments');
      convertTimeFormat(availableAppointments.results ?? []);
      emit(GetAvailableAppointmentsSuccessState(success));
    });
  }

  List<String> amTimes = [];
  List<String> pmTimes = [];
  List<String> times = [];
  void convertTimeFormat(List<DateTime> dateTimes) {
    amTimes = [];
    pmTimes = [];

    for (DateTime dateTime in dateTimes) {
      dateTime = dateTime.toLocal();
      DateFormat timeFormat = DateFormat('h:mm a');
      String time = timeFormat.format(dateTime);
      times.add(time);
    }
    amTimes = times.where((time) => time.endsWith("AM")).toList();

    pmTimes = times.where((time) => time.endsWith("PM")).toList();

    print("AM times:");
    for (var time in amTimes) {
      print(time);
    }

    print("PM times:");
    for (var time in pmTimes) {
      print(time);
    }
  }

  String convertTimeToDateTimeString(String? timeStr) {
    DateTime now = DateTime.now();
    String dateStr = DateFormat('yyyy-MM-dd').format(now);
    String dateTimeStr = '$dateStr $timeStr';
    DateTime dateTime = DateFormat('yyyy-MM-dd hh:mm a').parse(dateTimeStr);
    dateTime = dateTime.toUtc();
    String dateTimeString = dateTime.toIso8601String();
    return dateTimeString;
  }
}
