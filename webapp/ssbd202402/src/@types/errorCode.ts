export interface ErrorCode {
  exceptionCode: ExceptionCode;
  message: string;
}

export type ExceptionCode =
  | "undefined"
  | "optimisticLock"
  | "registrationError"
  | "identicalLoginOrEmail"
  | "identicalEmail"
  | "invalidData"
  | "invalidLoginData"
  | "invalidPassword"
  | "loginNotMatchToOTP"
  | "passwordRepetition"
  | "invalidRefreshToken"
  | "signInBlocked"
  | "userAlreadyBlocked"
  | "userAlreadyUnblocked"
  | "userBlocked"
  | "userInactive"
  | "userNotVerified"
  | "verificationTokenExpired"
  | "verificationTokenUsed"
  | "internalServerError"
  | "administratorOwnRoleRemoval"
  | "administratorOwnBlock"
  | "notFound"
  | "userNotFound"
  | "themeNotFound"
  | "somethingWentWrong"
  | "accessDenied"
  | "jwtTokenInvalid"
  | "validationError"
  | "rollback"
  | "unexpectedRollback"
  | "transaction"
  | "accessLevelAssigned"
  | "accessLevelTaken"
  | "roleRequestAlreadyExists"
  | "userAlreadyHasRole"
  | "localNotFound"
  | "localNotActive"
  | "localNotInactive"
  | "localNotUnapproved"
  | "rentNotFound"
  | "invalidLocalStateArchive"
  | "applicationExists"
  | "dateParsingError"
  | "addressAlreadyAssigned"
  | "variableFeeAlreadyExists"
  | "wrongEndDate";
