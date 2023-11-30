class BranchArguments {

  BranchArguments(
      {required this.branchName,
        required this.image,
        required this.phoneNumber,
        required this.address,
        required this.workEnd,
        required this.workStart}
      );
  final String branchName;
  final String workStart;
  final String workEnd;
  final String address;
  final String image;
  final String phoneNumber;

}