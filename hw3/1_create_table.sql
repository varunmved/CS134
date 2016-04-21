CREATE TABLE Customer
(
    ssn char(9),
    fname varchar(25),
    lname varchar(25),
    phone char(10),
    address varchar(50),
    PRIMARY KEY (ssn)
);

CREATE TABLE Account
(
    acc_no char(9),
    balance decimal(15,2),
    open_date date,
    atype varchar(10),
    PRIMARY KEY (acc_no)
);

CREATE TABLE Owns
(
    ssn char(9),
    acc_no char(9),
    own_date date,
    FOREIGN KEY (ssn) references Customer(ssn),
    FOREIGN KEY (acc_no) references Account(acc_no)
);

CREATE TABLE Loan
(
    loan_no char(9),
    amount decimal(15,2),
    ltype varchar(10),
    PRIMARY KEY (loan_no)
);

CREATE TABLE Payment
(
    loan_no char(9),
    payment_no char(4),
    amount decimal(15,2),
    method varchar(10),
    status varchar(10),
    due_date date,
    FOREIGN KEY (loan_no) references Loan(loan_no)
);

CREATE TABLE Borrows
(
    ssn char(9),
    loan_no char(9),
    FOREIGN KEY (ssn) references Customer(ssn),
    FOREIGN KEY (loan_no) references Loan(loan_no)
);

