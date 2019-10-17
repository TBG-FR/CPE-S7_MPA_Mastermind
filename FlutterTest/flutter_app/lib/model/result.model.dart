
import 'enums/result.enum.dart';
import 'combination.model.dart';

class ResultModel {

  //static final List<Color> availableColors  = new List<Color>(codeLength);
  CombinationModel secretCode;// = new Combination();
  int numberOfTries;
  ResultEnum gameResult;

  ResultModel(CombinationModel code, int tries)
  {
    this.secretCode = code;
    this.numberOfTries = tries;
  }

  factory ResultModel.abortedGame(CombinationModel code, int tries)
  {
    ResultModel resultInstance = ResultModel(code, tries - 1);
    resultInstance.gameResult = ResultEnum.aborted;
    return resultInstance;
  }

  factory ResultModel.finishedGame(CombinationModel code, int tries, ResultEnum result)
  {
    ResultModel resultInstance = ResultModel(code, tries);
    resultInstance.gameResult = result;
    return resultInstance;
  }

}