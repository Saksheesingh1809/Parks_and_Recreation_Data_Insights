SELECT * 
FROM parks_and_recreation.employee_demographics;

select *
From parks_and_recreation.employee_salary;

Select *
From employee_demographics ;

Select first_name , 
last_name , 
birth_date ,
Age, 
Age + 10
From parks_and_recreation.employee_demographics;

# PEMDAS

Select first_name , 
last_name , 
birth_date ,
Age, 
( Age + 10 ) *10 
From parks_and_recreation.employee_demographics;

SELECT distinct first_name 
FROM parks_and_recreation.employee_demographics;

Select Gender
From parks_and_recreation.employee_demographics ; 


Select distinct first_name , gender 
From parks_and_recreation.employee_demographics ; 


# WHERE CLAUSE

Select *
From employee_salary 
Where first_name = 'leslie' ;

Select *
From employee_salary
Where salary > 50000 ;

Select *
From employee_salary
Where salary  >= 50000 ;

Select *
From employee_salary
Where salary < 50000 ;

Select *
From parks_and_recreation.employee_demographics
Where gender = 'Female';

Select *
From parks_and_recreation.employee_demographics
Where gender != 'Female';

Select *
From parks_and_recreation.employee_demographics
Where gender != 'Female' ;

Select *
From parks_and_recreation.employee_demographics
Where birth_date > '1985-01-01' ;

#LOGICAL OPERATORS

Select *
From parks_and_recreation.employee_demographics
Where birth_date > '1985-01-01' And Gender = 'Male' ;

Select *
From parks_and_recreation.employee_demographics
Where birth_date > '1985-01-01' OR Not Gender = 'Male' ;

Select *
From parks_and_recreation.employee_demographics
Where (first_name ='Leslie' AND Age = 44) OR Age >55 ;


Select *
From employee_demographics
Where first_name like 'Jer%' ;

Select *
From employee_demographics
Where first_name like '%er%' ;

Select *
From employee_demographics
Where first_name like '%a%' ;

Select *
From employee_demographics
Where first_name like '%a%' ;

# GROUP BY AND ORDER BY 

Select Gender 
From employee_demographics
Group by Gender ;

Select first_name
From employee_demographics
Group by Gender ;

Select gender , avg(age)
From employee_demographics
Group by Gender ;

Select Occupation, Salary
From employee_salary
Group by occupation, salary;

Select Gender , avg(Age) , max(age) , Min(age)
From employee_demographics
Group by Gender ;

Select Gender , avg(Age) , max(age) , Min(age) , Count(age)
From employee_demographics
Group by Gender ;

# ORDER BY 

Select *
From employee_demographics ;

Select first_name
From employee_demographics
order by first_name ;

Select first_name
From employee_demographics
order by first_name desc;

Select *
From employee_demographics
order by Gender ;

Select *
From employee_demographics
order by Age , Gender ;

Select *
From employee_demographics
order by Age Desc , Gender ;

Select *
From employee_demographics
Order By 5 , 4 ;

# HAVING AND WHERE CLAUSE

Select gender, avg (AGE)
From employee_demographics
Group by gender
Having avg (age) > 40 ;

Select Occupation, Avg(Salary)
From employee_salary
Group by Occupation ;

Select Occupation, Avg(Salary)
From employee_salary
Where Occupation like '%manager%'
Group By Occupation 
 Having avg(salary) > 75000 ;
 
 
 # LIMIT AND ALIASING 
 
 select *
 From Employee_demographics ;
 
 Select *
 From Employee_demographics
 Order By age Desc 
 Limit 3 ;
 
 Select *
 From Employee_demographics
 Order By age Desc 
 Limit 2 , 1 ;
 
 # ALIASING 
 
 Select Gender , Avg(Age) as avg_age
 From Employee_demographics
 Group By Gender
 Having Avg(age) > 40 ;
 
 # JOINTS 
 
Select *
From Employee_demographics
inner join employee_salary 
		On employee_demographics.Employee_id+ 1 = employee_salary.employee_id ;
        
        
#SELF JOIN

Select *
From employee_salary emp1 
Join employee_salary emp2
	on emp1.employee_id = emp2.employee_id ;

Select *
From employee_salary emp1 
Join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id ;

Select emp1.employee_id As emp_santa ,
	emp1.first_name as first_name_Santa ,
    emp1.last_name as last_name_Santa ,
    emp2.employee_id as emp_santa ,
    emp2.first_name as first_name_emp ,
    emp2.last_name as last_name_emp 
From employee_salary emp1 
Join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id ;
  
  
  # JOINING MULTIPLE TANBLES TOGETHER
  
  Select *
  From employee_demographics As Dem
  Inner Join employee_salary As Sal
		on dem.employee_id = sal.employee_id ;
        
        
 Select *
  From parks_departments ;
 
  Select *
  From employee_demographics As Dem
  Inner Join employee_salary As Sal
		on dem.employee_id = sal.employee_id 
        Inner join parks_departments As PD
        on sal.dept_id =pd.department_id  ;
        
        
SELECT  first_name, last_name
FROM employee_demographics 
UNION DISTINCT 
SELECT First_name, last_name
FROM employee_salary;
        
 SELECT  first_name, last_name
FROM employee_demographics 
UNION ALL
SELECT First_name, last_name
FROM employee_salary;
        
Select first_name , Last_name , 'old' as Label
From employee_demographics
where age >50 
Union 
Select first_name , Last_name , 'Highly Paid employee' as Label
From employee_salary
where salary > 70000 ;


Select first_name , Last_name , 'old Man' as Label
	From employee_demographics
		where age >40 And Gender = 'Male'
Union 
Select first_name , Last_name , 'old lady' as Label
		From employee_demographics
			where age >30 And Gender = 'Female'
Union 
Select first_name , Last_name , 'Highly Paid employee' as Label
			From employee_salary
						where salary > 70000
                        Order by First_name , last_name;
                        
  # STRING FUNCTIONS
  
  select Length ('sky' ) ;
  
Select First_name , Length (first_name)
From employee_demographics ;

Select Upper ('sky') ;

Select Lower( 'sky') ;

Select First_name , UPPER (FIRST_NAME) , Upper(last_name)
From employee_demographics ;

Select Trim ('        sky        ') ;

Select First_name , 
	left(first_name, 4) ,
     Right (first_name ,4)
From Employee_demographics ;

Select First_name , 
	left(first_name, 4) ,
     Right (first_name ,4) , substring(First_name, 3, 2) AS Short_name
From Employee_demographics ;


Select First_name , 
	left(first_name, 4) ,
     Right (first_name ,4) , substring(First_name, 3, 2) AS Short_name,
    Substring(birth_date , 6, 2) as birth_month
From Employee_demographics ;

Select first_name , Replace(first_name , 'a','sz') as some_random_name
From employee_Demographics ;

Select Locate( 'AN', first_name)
From employee_demographics ;


Select first_name , last_name, 
CONCAT(first_name , ' ' , last_name) AS Full_name 
From employee_Demographics ; 


#CASE STATEMENTS

Select First_name , last_name,
CASE 
	 When age <= 30 then 'YOUNG' 
End 
From employee_demographics ;

Select First_name , last_name,
CASE 
	 When age <= 30 then 'Young' 
     When age between 31 and 40 then 'Working professional'
     When age  Between 41 and 50 then ' Old'
     When age > 50 then 'Death is near'
End  As 'Caselets'
From employee_demographics ;


---#PAY INCREASE AND BONUS
	# <500000 = 5%
    # >50000 = 7%
    # Finance = 10% Bonus

Select *
	From employee_salary ;

Select First_name, Last_name , salary ,
Case 
		When Salary < 50000 Then  salary +(salary *0.05)
        When Salary > 50000 Then Salary + (Salary * 0.07)
        When Salary = 50000 Then Salary + (Salary * 0.03)
 End  As 'New Salary', 
 Case 
		When dept_id = 6 Then salary * 1.10
 End   As 'Bonus'
 From employee_salary ;
 
 # -------SUBQUERIES
 
 Select * 
 From employee_demographics 
	where employee_id In  
					(Select Employee_id 
								From employee_salary 
                                Where dept_id = 1) ;
                                
                                
  Select First_name , salary , 
  (Select Avg(salary)
		From employee_salary)
    From employee_salary ;
    
    
    Select Gender , Avg(age) , Min(age) , Count(age)
		From employee_demographics 
    Group By Gender     ;
        
 Select  avg(Max_age)
 From 
 (Select Gender , Avg(age) As Avg_age,
 Max(AGE) as max_age,
 Min(Age) as min_age ,
 Count(age)
		From employee_demographics 
    Group By Gender) As Agg_table ;
    
    Select gender , Avg(salary) As Avg_Salary
         From employee_demographics as dem
         Join employee_salary as sal
         On  dem.employee_id = sal.employee_id 
         Group By Gender ;
         
#--------WINDOW FUNCTION

Select dem.first_name, dem.last_name, gender , 
					Avg(salary) Over(partition by gender)
				From employee_demographics as dem
         Join employee_salary as sal
         On  dem.employee_id = sal.employee_id ;
         
     Select dem.first_name, dem.last_name, gender , 
					Avg(salary) as avg_salary
				From employee_demographics as dem
         Join employee_salary as sal
         On  dem.employee_id = sal.employee_id 
         Group by dem.First_name, dem.last_name, gender ;
             
         
Select dem.first_name, dem.last_name, gender , salary ,
	sum(salary) Over(partition by gender  order by dem.employee_id) as Rolling_Total
				From employee_demographics as dem
         Join employee_salary as sal
         On  dem.employee_id = sal.employee_id ;
         
        
 Select dem.employee_id ,  dem.first_name, dem.last_name, gender , salary ,
			row_number() Over(partition by gender order by Salary Desc) as Row_num,
            Rank()  Over(partition by gender order by Salary Desc) as Rank_num,
            dense_rank()  Over(partition by gender order by Salary Desc) as dense_Rank_num
				From employee_demographics as dem
						Join employee_salary as sal
							On  dem.employee_id = sal.employee_id ;

 
  #-------CTEs-Common Table Expression   { KeyWord to Define CTE is With }

With CTE_Example As
(
Select Gender, Avg(salary) as avg_sal , Max(Salary) as max_sal , Min(Salary) as min_sal, Count(Salary)
		From employee_demographics dem
        Join employee_salary sal
				on dem.employee_id = sal.employee_id
                Group By Gender ) 
  Select * 
  From CTE_example
  ;
        
With CTE_Example As
(
Select Gender, Avg(salary) as avg_sal , Max(Salary) as max_sal , Min(Salary) as min_sal, Count(Salary)
		From employee_demographics dem
        Join employee_salary sal
				on dem.employee_id = sal.employee_id
                Group By Gender 
) 
						  Select avg_sal 
						  From CTE_example  ;


Select Avg(avg_sal)
From ( Select Gender, Avg(salary) as avg_sal , Max(Salary) as max_sal , Min(Salary) as min_sal, Count(Salary)
		From employee_demographics dem
        Join employee_salary sal
				on dem.employee_id = sal.employee_id
                Group By Gender ) exmaple_subquery  ;


With CTE_Example As
(
			Select employee_id , gender , birth_date 
					From employee_demographics dem
				   where birth_date > '1985-01-01'
) ,
CTE_Example2 As
(
			Select employee_id, salary 
			From employee_salary 
			Where salary > 50000
)
Select *
		From CTE_Example 
		Join CTE_Example2 
		On CTE_Example.employee_id = CTE_Example2.employee_id ;

 




