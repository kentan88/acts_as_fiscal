Acts As Fiscal
======
Extends Date and Time class to provide fiscal date helper methods.

Installation
------
Add the following line to your Gemfile:

<pre>
gem 'acts_as_fiscal', git: 'git@github.com:kentan88/acts_as_fiscal.git'
</pre>

Usage
------
Override the constant FY_START_MONTH anywhere under your initializers directory. Default value is 4 (April).


To get the financial year based on today's date.

<pre>
Date.today.financial_year
</pre>

To get the start date of the financial year based on today's date.

<pre>
Date.today.beginning_of_financial_year
</pre>

To get the end date of the financial year based on today's date.

<pre>
Date.today.end_of_financial_year
</pre>

To get the financial quarter of the financial year based on today's date.

<pre>
Date.today.financial_quarter
</pre>
