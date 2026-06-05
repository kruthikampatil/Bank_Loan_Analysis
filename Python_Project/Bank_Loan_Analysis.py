import pandas as pd
import numpy as np

df = pd.read_csv("Bank_Loan_Analysis_Dataset.csv")

print("Total Loan:", np.sum(df["Loan_Amount"]))
print("Average Income:", np.mean(df["Income"]))
print("Maximum Loan:", np.max(df["Loan_Amount"]))

print("\nLoan Status Count")
print(df["Loan_Status"].value_counts())

print("\nRegion-wise Loan Amount")
print(df.groupby("Region")["Loan_Amount"].sum())

print("\nTop 5 Highest Loans")
print(df.nlargest(5, "Loan_Amount")[["Customer_Name", "Loan_Amount"]])

approval = ((df["Loan_Status"] == "Approved").sum()/len(df))*100

print("\nApproval Percentage:", approval)