/* 
-> Single Responsibility principle states that a class should only have one reason to change.

-> Since the below class contains two different operations: user authentication, & user profile updatation. 
Due to this the single responsibility principle gets violated as the class can have multiple reasons to change.
i.e. EITHER authenticateUser might get changed do to some update in security context OR the class might be changed due to the change in updation of user profile operations.

-> Hence, the class UserManager might get changed due to 2 different reasons, Therefore, it is the violation of Single Responsibility Principle.
*/
class UserManager {
  bool authenticateUser(
    String username,
    String password,
  ) {
    return true;
  }

  void updateUserProfile(
    String username,
    Map<String, dynamic> profileInfo,
  ) {
    print("User profile update for $username");
  }
}

/* Thus, to ensure that Single Responsibility Principle, doesn't get violated, we need to make separate class for each operations */
class AuthManager {
  bool authenticateUser(
    String username,
    String password,
  ) {
    // Simulate authentication logic
    return username == "user" && password == "pass";
  }
}

class ProfileManager {
  void updateUserProfile(
    String username,
    Map<String, dynamic> profileInfo,
  ) {
    // Simulate profile update logic
    print("User profile updated for $username with info: $profileInfo");
  }
}

void main() {
  final authManager = AuthManager();
  final profileManager = ProfileManager();

  // Example usage
  String username = "user";
  String password = "pass";

  if (authManager.authenticateUser(username, password)) {
    print("User authenticated successfully.");

    Map<String, dynamic> profileInfo = {
      "email": "user@example.com",
      "phone": "123-456-7890"
    };

    profileManager.updateUserProfile(username, profileInfo);
  } else {
    print("Authentication failed.");
  }
}


/* Along with the statement of Single Responsibility Principle, there's another saying for it which is stated as follows:
"We want to gather together the things that gets changed for same reason & distinguish the things/operations that gets changed for different reasons."

Single responsibility principle is advantegous in many ways: 
1. Maintainability: When a class has a single responsibility, it becomes easier to understand, modify, and test. This reduces the likelihood of introducing bugs and makes it easier to make changes without affecting unrelated parts of the codebase.

2. Reusability: A class with a single responsibility is more likely to be reusable in different contexts. This reduces the amount of code duplication and makes it easier to integrate the class into different projects.

3. Simplicity: A class with a single responsibility is simpler and less complex. This makes it easier to reason about and maintain the code.
 */