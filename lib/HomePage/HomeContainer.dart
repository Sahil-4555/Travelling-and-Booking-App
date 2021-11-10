import 'package:travelling_booking/HomePage/cmodel.dart';
import 'package:travelling_booking/HomePage/ModelDetail.dart';

List<TripDetails> getTripList() {
  List<TripDetails> recommendedTripList = [
    TripDetails.data(
        1,
        'https://images.unsplash.com/photo-1537996194471-e657df975ab4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1954&q=80',
        'Flight to Kerala',
        'Trip',
        '\RS.1,20,000',
        'Kerala, a state in Southern India is known as a tropical paradise of waving palms and wide sandy beaches. It is a narrow strip of coastal territory that slopes down the Western Ghats in a cascade of lush green vegetation, and reaches to the Arabian sea.',
        false,
        5),
    TripDetails.data(
        2,
        'https://images.unsplash.com/photo-1505761671935-60b3a7427bad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
        'Flight to London',
        'Trip',
        '\RS.6,00,000',
        'London is the capital city of the United Kingdom. It is the U.K.\'s largest metropolis and its economic, transportation, and cultural centre. London is also among the oldest of the world\'s great cities, with its history spanning nearly two millennia.',
        false,
        5),
    TripDetails.data(
        3,
        'https://images.unsplash.com/flagged/photo-1562503542-2a1e6f03b16b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1936&q=80',
        'Flight to Singapore',
        'Trip',
        '\RS.5,50,000',
        'Singapore is a wealthy city state in south-east Asia. Once a British colonial trading post, today it is a thriving global financial hub and described as one of Asia\'s economic "tigers". It is also renowned for its conservatism and strict local laws and the country prides itself on its stability and security.',
        false,
        5),
    TripDetails.data(
        4,
        'https://images.unsplash.com/photo-1519451241324-20b4ea2c4220?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
        'Flight to Thailand',
        'Trip',
        '\RS.8,25,000',
        'Thailand is one of the prettiest South-Asian countries, which is why Thailand tourism has increased over time. Apart from the attractions of the country\'s capital city - Bangkok, Thailand is dotted with rainforests, pretty white sand beaches, amazing taverns, beautiful resorts, and many historical temples.',
        false,
        5),
    TripDetails.data(
        5,
        'https://images.unsplash.com/photo-1534430480872-3498386e7856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
        'Flight to New York',
        'Trip',
        '\RS.5,85,000',
        'There is so much to see in New York City! Its bustling streets are a whirlwind of activity, and there are world-famous sites around every corner. From the iconic landmarks like the Brooklyn Bridge to the city’s incredible food scene and the fascinating museums, you could spend months exploring NYC. Here’s my ultimate New York travel guide to help you plan an unforgettable trip!',
        false,
        5),
  ];
  return recommendedTripList;
}

List<CategoryModel> getCategoryList() {
  List<CategoryModel> categoryList = [
    CategoryModel.data(1, 'assets/images/icons/airplane.png', 'Flights'),
    CategoryModel.data(1, 'assets/images/icons/hotel.png', 'Hotels'),
    CategoryModel.data(1, 'assets/images/icons/calendar.png', 'Events'),
    CategoryModel.data(1, 'assets/images/icons/car.png', 'Cars')
  ];
  return categoryList;
}