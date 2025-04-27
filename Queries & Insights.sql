--CustomerID of customer who borrowed a book more than once
select B.MemberID, M.Name, Count(B.MemberID) as TimesBorrowed from Borrowed B
join Members M on B.MemberID = M.MemberID
group by B.MemberID, M.Name
Having Count(B.MemberID) > 1;

--Books that were borrowed more than once
select B.Title, Count(*) as BookBorrowed from Books B
join Borrowed Bo on B.BookID = Bo.BookID
group by B.Title, B.BookID
Having Count(*) > 1 ;

--Members whose Book reservations were not fulfilled
select M.Name, M.Phone_Number from Members M
Join Reservations R on M.MemberID = R.MemberID
where R.Status = 'Not Fulfilled';

--Members whose Book reservations were canceled
select M.Name, M.Phone_Number from Members M
Join Reservations R on M.MemberID = R.MemberID
where R.Status = 'Canceled';

--Books that were returned late or are still outstanding
select B.BookID, B.Title, Bo.Due_Date, Bo.Return_Date from Borrowed Bo
join Books B on B.BookID = Bo.BookID
where Bo.Return_Date > Bo.Due_Date or Bo.Return_Date is null;

--Books returned on time or early
select B.BookID, B.Title, Bo.Due_Date, Bo.Return_Date from Borrowed Bo
join Books B on B.BookID = Bo.BookID
where Bo.Return_Date <= Bo.Due_Date;

--Genre which was checked out the most
select B.Genre, Count(*) as TimeBorrowed from Books B
join Borrowed Bo on B.BookID = Bo.BookID
group by B.Genre
order by TimeBorrowed desc

---------------------------INDEXES------------------------------

select * from Borrowed
where Due_Date < GETDATE();

select * from Reservations
where MemberID = '95';

select * from Books 
where Genre = 'Autobiography'




