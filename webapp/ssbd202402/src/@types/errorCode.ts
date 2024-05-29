export interface ErrorCode {
  exceptionCode: ExceptionCode;
  message: string;
}

export type ExceptionCode =
  | "optimisticLock"
  | "registrationError"
  | "identicalLoginOrEmail"
  | "invalidData"
  | "invalidLoginData"
  | "invalidPassword"
  | "loginNotMatchToOTP"
  | "passwordRepetition"
  | "invalidRefreshToken"
  | "signInBlocked"
  | "timezoneNotFound"
  | "userAlreadyBlocked"
  | "userAlreadyUnblocked"
  | "userBlocked"
  | "userInactive"
  | "userNotVerified"
  | "verificationTokenExpired"
  | "verificationTokenUsed"
  | "administratorOwnRoleRemoval"
  | "administratorOwnBlock"
  | "notFound"
  | "userNotFound"
  | "themeNotFound"
  | "somethingWentWrong"
  | "accessDenied"
  | "jwtTokenInvalid"
  | "validationError"
  | "identicalEmail"
  | "internalServerError";