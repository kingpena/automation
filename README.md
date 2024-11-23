# automation

# Robot Framework Project

## Project Structure
- **tests/**: Contains test cases grouped by purpose (e.g., smoke, regression).
- **resources/**: Reusable components like keywords, variables, and locators.
- **logs/**: Stores log files for debugging.
- **results/**: Stores test output reports and screenshots.
- **drivers/**: Contains browser drivers like ChromeDriver.

## Prerequisites
- Install Python.
- Install Robot Framework: `pip install robotframework`.
- Install SeleniumLibrary: `pip install robotframework-seleniumlibrary`.
- Place the appropriate `chromedriver` in the `drivers/` folder.

## Running Tests
1. Navigate to the project root directory.
2. Run tests using Robot Framework:
   ```bash
   robot -d results tests/smoke/search_google.robot
