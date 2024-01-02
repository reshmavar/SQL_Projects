CREATE DATABASE bank;
USE bank;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Insert Customers
INSERT INTO customers (name, address) VALUES
('John Doe', '123 Main St'),
('Jane Smith', '456 Oak St'),
('Sam Johnson', '789 Pine St');

-- Insert Accounts
INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1, 'Savings', 5000.00),
(2, 'Checking', 8000.00),
(3, 'Savings', 10000.00);

-- Insert Transactions
INSERT INTO transactions (account_id, transaction_type, amount, transaction_date) VALUES
(1, 'Deposit', 1000.00, '2023-01-01'),
(2, 'Withdrawal', 500.00, '2023-01-02'),
(3, 'Deposit', 2000.00, '2023-01-03'),
(1, 'Withdrawal', 700.00, '2023-01-04');

SELECT customers.*, accounts.account_type, transactions.transaction_type, transactions.amount, transactions.transaction_date
FROM customers
JOIN accounts ON customers.customer_id = accounts.customer_id
JOIN transactions ON accounts.account_id = transactions.account_id;

SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type
HAVING total_balance > 5000;







