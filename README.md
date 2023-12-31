# Cardiovascular adverse events associated with monoclonal antibody drugs in COVID-19 patients  

This is a real-world data mining project using the publicly available database of FDA Adverse Event Reporting System (FAERS). This work was published on Pharmaceuticals (Basel). 2022 Dec; 15(12): 1472. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9782649/

I used SQLite for data management and extraction, Python libraries Pandas and Matplotlib for data processing and visualization. Different statistical tools were used in this study, including disproportionality analysis, Chi square test, and Fisher's exact test.

### Background
Monoclonal antibody drugs have been used to treat COVID-19 patients. But the cardiovascular adverse events associated with these drugs have not been studied yet. In the study, we used publically availabe database of FDA Adverse Event Reporting System (FAERS) to study the adverse effects of these drugs.  FAERS is a database for the spontaneous reporting of adverse events and medication errors involving human drugs and therapeutic biological products. It is one of the largest pharmacovigilant database in the world.  

Open the Jupyter notebook file **(covid drug adverse events.ipynb)** to read the details.  

### What I did  
- Created database from downloaded text files. I compared SQLite and MySQL and found SQLite is faster. The best way to create the database was first combining all CSV files into one CSV file and then importing the CSV file from SQLite.
- Extracted dataset for COVID-19 patients using SQL
- Did exploratory data analysis with Pandas library. I also tried PySpark on Google Colab, but Pandas on my own computer is more efficient for this dataset
- Did disproportionality analysis for cardiovascular adverse event associated with monoclonal antibodies. Reporting odds ratio and information component were used for signal detection
- Did chi square and Fisher's exact test to examine whether some outcomes are associated with cardiovascular adverse events