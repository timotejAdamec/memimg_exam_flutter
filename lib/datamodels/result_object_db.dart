class ResultObjectDB {
  final String userID;
  final String result;
  final String userName;

  ResultObjectDB(this.userID, this.result, this.userName);

  Map<String, dynamic> toMap() {
    return {'result': result, 'userID': userID, 'userName': userName};
  }
}
