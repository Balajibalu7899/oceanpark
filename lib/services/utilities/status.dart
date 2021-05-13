enum State { LODING, COMPLETED, ERROR }

class Status {
  State state = State.LODING;
  Status.loding() : state = State.LODING;

  Status.completed() : state = State.COMPLETED;

  Status.error() : state = State.ERROR;
}
