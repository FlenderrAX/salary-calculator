       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALARY_CALCULATOR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 EMPLOYEE_STATS.
           05 EMPLOYEE_NAME PIC A(10).
           05 HOURLY_SALARY PIC 9(3).
           05 WORKED_HOURS PIC 9(3).
         
       01 TAXATION.
           05 TAX PIC 99V9 VALUE 22.5.

       01 SOCIAL_CONTRIBUTIONS.
           05 SOCIAL_SECURITY PIC 99V9 VALUE 15.5.
           05 UNEMPLOYMENT PIC 9V99 VALUE 4.05.
           05 SUPPLEMENTARY_PENSION PIC 9 VALUE 7.

       01 RESULT PIC 9(5).
       01 SALARY PIC ZZZZZ.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Enter the employee's name: ".
           ACCEPT EMPLOYEE_NAME.
           DISPLAY "Enter the hourly salary: ".
           ACCEPT HOURLY_SALARY.
           DISPLAY "Enter the number of hours worked: ".
           ACCEPT WORKED_HOURS.
           PERFORM CALCULATE-SALARY.
           STOP RUN.

       CALCULATE-SALARY SECTION.
           COMPUTE RESULT = (WORKED_HOURS * HOURLY_SALARY) *
            (1 - ((SOCIAL_SECURITY + SUPPLEMENTARY_PENSION +
             UNEMPLOYMENT)/100)) 
             * (1 - (TAX/100)).
           MOVE RESULT TO SALARY
           DISPLAY "Salary of Employee: " EMPLOYEE_NAME ":" SALARY "$".
           EXIT.

       END PROGRAM SALARY_CALCULATOR.
