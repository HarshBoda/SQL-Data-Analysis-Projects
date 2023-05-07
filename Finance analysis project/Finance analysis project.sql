select * from accounts;
select * from branches;
select * from customers;
select * from transactions;

-- 1. What are the names of all the customers who live in New York?
select concat(firstname," ",lastname) as fullname,city from customers
where city="New York";

-- 2. What is the total number of accounts in the Accounts table?
select count(AccountID) total_accounts from accounts;

-- 3. What is the total balance of all checking accounts?
select sum(balance) total_balance from accounts
where AccountType="Checking";

-- 4. What is the total balance of all accounts associated with customers who live in Los Angeles?
select sum(a.balance) total_balance from accounts a join customers c  using(customerid)
where city="Los Angeles";

-- 5. Which branch has the highest average account balance?
select b.branchname,avg(a.balance) average_balance from accounts a join branches b using(branchid)
group by b.branchname
order by avg(a.balance) desc limit 1;

-- 6. Which customer has the highest current balance in their accounts?
select concat(firstname," ",lastname) full_name, sum(a.balance) as highest_balance from customers c
join accounts a using(customerid)
group by concat(firstname," ",lastname) 
order by highest_balance desc limit 1 ;
             
-- 7. Which customer has made the most transactions in the Transactions table?
select concat(c.firstname," ",c.lastname) full_name ,count(t.accountid) total_transactions from transactions t
join accounts a using(accountid)
join customers c using(customerid)
group by concat(c.firstname," ",c.lastname)
order by total_transactions desc limit 2;
								-- OR --
with cte as (
select concat(c.firstname," ",c.lastname) full_name ,count(t.accountid) total_transactions,
dense_rank()over(order by count(t.accountid) desc ) rn
from transactions t
join accounts a using(accountid)
join customers c using(customerid)
group by concat(c.firstname," ",c.lastname) )
select cte.full_name,cte.total_transactions from cte
where rn=1;

-- 8.Which branch has the highest total balance across all of its accounts?
select b.branchname, sum(balance) total_balance from accounts a 
join branches b 
using(branchid) 
group by b.branchname
order by total_balance desc limit 1;

-- 9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
select concat(firstname," ",lastname) as fullname,sum(balance) total_balance from accounts a 
join customers c 
using(customerid)
group by concat(firstname," ",lastname)
order by total_balance desc limit 1;

-- 10. Which branch has the highest number of transactions in the Transactions table?
select b.BranchName,count(transactionid) total_transactions from branches b 
join accounts a 
using(branchid)
join transactions t
using(accountid)
group by b.BranchName
order by total_transactions desc limit 2;
