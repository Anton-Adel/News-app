abstract class NewsStates {}

class InitialState extends NewsStates{}

class BottomNavBarState extends NewsStates{}

class BusinessLoadingState extends NewsStates{}

class getBusinessSuccessfulyState extends NewsStates{}

class getBusinessErrorState extends NewsStates{
  final String error;

  getBusinessErrorState(this.error);

}

class SportLoadingState extends NewsStates{}

class getSportSuccessfulyState extends NewsStates{}

class getSportErrorState extends NewsStates{
  final String error;

  getSportErrorState(this.error);

}

class ScienceLoadingState extends NewsStates{}

class getScienceSuccessfulyState extends NewsStates{}

class getScienceErrorState extends NewsStates{
  final String error;

  getScienceErrorState(this.error);

}

class ModeState extends NewsStates{}



class SearchLoadingState extends NewsStates{}

class getSearchSuccessfulyState extends NewsStates{}

class getSearchErrorState extends NewsStates{
  final String error;

  getSearchErrorState(this.error);

}



