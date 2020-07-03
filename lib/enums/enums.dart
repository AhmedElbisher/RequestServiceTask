enum ViewState { IDLE, BUSY }
enum Status {
  START,
  SELECT_SERVICE,
  SELECT_TRANSPORTATION_METHOD,
  SELSCT_NUMBER_OF_TIRES,
  SELECT_MAINTANANCE_TYPE,
  SELECT_PROVIDER,
  No_Result,
}

enum LocalNav {
  START,
  SELECT_SERVICE,
  SELECT_TRANSPORTATION_METHOD,
  SELSCT_NUMBER_OF_TIRES,
  SELECT_MAINTANANCE_TYPE,
  No_Result,
}
enum Service { MAINTAINANCE, TIRES, PERIODIC_CHECK }
enum NumberOfTires { ONE, TWO, TREE, FOUR }
enum Inspection { WINCH, SERVICE_PROVIDER_HIMSELF }
enum Maintainance { ELECTRICAL, MECHANICAL, OTHER }
