
--Q1. How many Programmers Don’t know PASCAL and C

      SELECT count(PNAME)AS No_prog from programmer where prof1!='pascal' and PROF1!='c'
      and prof2!='pascal' and prof2!='c'

--Q2. Display the details of those who don’t know Clipper, COBOL or PASCAL.

      SELECT * FROM programmer WHERE PROF1 NOT IN ('Clipper', 'COBOL', 'PASCAL')
	  AND PROF2 NOT IN ('Clipper', 'COBOL', 'PASCAL')

      
--Q3. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
    
	  SELECT DEVELOPIN, AVG(SCOST), AVG(DCOST), AVG(SOLD) FROM software
      GROUP BY DEVELOPIN
	  	 
--Q4. List the programmer names (from the programmer table) and No. Of Packages each has developed.

      SELECT PROGRAMMER.PNAME,COUNT(TITLE) AS NO_OF_PACKAGES FROM PROGRAMMER INNER JOIN software ON
      programmer.PNAME = software.PNAME GROUP BY PROGRAMMER.PNAME

--Q5. How many packages were developed by the female programmers earning more than the
--    highest paid male programmer?

     SELECT COUNT(TITLE) AS NO_OF_PACKAGES FROM PROGRAMMER INNER JOIN software ON
      programmer.PNAME = software.PNAME WHERE programmer.PNAME IN (SELECT PNAME
      FROM programmer WHERE GENDER = 'F' AND SALARY > (SELECT MAX(SALARY)
	  FROM programmer WHERE GENDER = 'M'))


--Q6. How much does the person who developed the highest selling package earn and what course
--    did HE/SHE undergo.

    SELECT P.SALARY, ST.COURSE
    FROM programmer P, software S, studies ST
    WHERE P.PNAME = S.PNAME AND P.PNAME = ST.PNAME AND S.SOLD = (SELECT MAX(SOLD) FROM software)



--Q7. In which institute did the person who developed the costliest package study?

     SELECT INSTITUTE FROM studies WHERE PNAME IN (SELECT PNAME FROM software
	 WHERE SCOST = (SELECT MAX(SCOST) FROM software))

--Q8. Display the names of the programmers who have not developed any packages.

     SELECT PNAME FROM programmer WHERE PNAME NOT IN (SELECT PNAME FROM software)

--Q9. Display the details of the software that has developed in the language which
--    is neither the first nor the second proficiency

      SELECT * FROM software WHERE DEVELOPIN NOT IN (SELECT PROF1 FROM programmer)
	  AND DEVELOPIN NOT IN (SELECT PROF2 FROM programmer)     

--Q10. Display the details of the software Developed by the male programmers Born before 1965
--     and female programmers born after 1975

       SELECT S.*  FROM programmer P, software S
      WHERE P.PNAME = S.PNAME AND  
	  (GENDER = 'M' AND DOB < '1965-01-01') OR
	   (GENDER = 'F' AND DOB >'1975-12-31')
	   

--Q11. Display the number of packages, No. of Copies Sold and sales value of each programmer
--     institute wise.


     SELECT INSTITUTE, COUNT(TITLE) AS NO_OF_PACKAGES, SUM(SOLD) AS NO_OF_COPIES_SOLD,
	 SUM(SOLD*SCOST) AS SALES_VALUE FROM studies, software WHERE studies.PNAME = software.PNAME
     GROUP BY INSTITUTE
       

--Q12. Display the details of the Software Developed by the Male Programmers Earning More
--     than 3000

      SELECT S.*  FROM programmer P, software S
      WHERE P.PNAME = S.PNAME AND GENDER = 'M' AND SALARY > 3000



--Q13. Who are the Female Programmers earning more than the Highest Paid male?

      SELECT PNAME FROM programmer WHERE GENDER = 'F' AND SALARY > (SELECT MAX(SALARY)
	  FROM programmer WHERE GENDER = 'M')



--Q14. Who are the male programmers earning below the AVG salary of Female Programmers?

      SELECT PNAME,SALARY FROM programmer WHERE GENDER = 'M' AND SALARY < (SELECT AVG(SALARY)
	  FROM programmer WHERE GENDER = 'F')



--Q15. Display the language used by each programmer to develop the Highest Selling and
--     Lowest-selling package.

    SELECT PNAME, DEVELOPIN FROM software WHERE SOLD = (SELECT MAX(SOLD) FROM software)
    OR SOLD = (SELECT MIN(SOLD) FROM software)

--Q16. Display the names of the packages, which have sold less than the AVG number of copies.

    SELECT TITLE FROM software WHERE SOLD < (SELECT AVG(SOLD) FROM software)


--Q17. Which is the costliest package developed in PASCAL.
 
	 SELECT TOP(1) TITLE , DCOST FROM software WHERE DEVELOPIN = 'PASCAL' ORDER BY DCOST DESC


--Q18. How many copies of the package that has the least difference between development and
--     selling cost were sold.

     SELECT TITLE, SOLD FROM software WHERE (SCOST - DCOST) = (SELECT MIN(SCOST - DCOST)
	 FROM software)
	 	 
--Q19.Which language has been used to develop the package,which has the highest sales amount?

    SELECT DEVELOPIN,(scost*SOLD) as Higest_Total_Sale_Amount FROM software where 
    (SCOST*sold) = (SELECT Max(SCOST*SOLD) FROM software)


--Q20. Who Developed the Package that has sold the least number of copies?

    SELECT PNAME FROM software WHERE SOLD = (SELECT MIN(SOLD) FROM software)

--Q21. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee

     
	 SELECT COURSE FROM studies WHERE COURSE_FEE BETWEEN (SELECT AVG(COURSE_FEE) - 1000
	 FROM studies) AND (SELECT AVG(COURSE_FEE) + 1000 FROM studies)



--Q22. Display the name of the Institute and Course, which has below AVG course fee.

      SELECT INSTITUTE, COURSE FROM studies WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE)
	  FROM studies)

  
--Q23. Which Institute conducts costliest course.

       SELECT INSTITUTE FROM studies WHERE COURSE_FEE=( SELECT MAX(COURSE_FEE)
	   FROM STUDIES)


--Q24. What is the Costliest course?

       SELECT COURSE,COURSE_FEE FROM studies WHERE COURSE_FEE=( SELECT MAX(COURSE_FEE)
	   FROM STUDIES)