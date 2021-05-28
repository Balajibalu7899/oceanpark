enum StatusState { LODING, COMPLETED, ERROR }

class Status {
  StatusState state = StatusState.LODING;
  Status.loding() : state = StatusState.LODING;

  Status.completed() : state = StatusState.COMPLETED;

  Status.error() : state = StatusState.ERROR;
}
