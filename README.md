# E-commerce-Exploratory-Data-Analysis

## 1. Project Background 
This project explores sales and marketing performance for a European fashion retailer operating across multiple countries through its e-commerce platform and mobile app. The dataset covers a three-month period and includes detailed information on products, customers, sales transactions, sales channels and promotional campaigns.

The objective of this exploratory data analysis (EDA) is to understand how promotional activity influences revenue, order behaviour, customer engagement and overall commercial performance. 

**Key areas of analysis include:**

- **Sales Trends:** revenue patterns, weekly performance, order behaviour and AOV changes-
- **Campaign Performance:** discount usage, promotion-driven revenue, uplift vs. non-promotion sales, and channel impact
- **Product Performance:** best-selling items, category contribution, pricing influence and discount sensitivity
- **Customer Insights:** customer purchases patterns, retention and behaviour segmentation

Insights from this analysis can help guide future marketing decisions and optimisation opportunities.
The technical side of the project can be seen here: 
The interactive dashboard can be downloaded here: 

## 2. Dataset Structure and Entity Relationship Diagram
The dataset consists of five tables arranged in a star schema: one fact table (fact_sales) and five dimension tables (products, customers, campaigns and date). I changed the data from header/detail schema to a star schema for faster query performance and I added a date table.

<img width="3840" height="2160" alt="Image" src="https://github.com/user-attachments/assets/e74bac21-d4fa-48f9-9bbf-c03d1df56a49" />

## 3.	Executive Summary

This analysis examines e-commerce sales, customer behaviour, and promotional performance for a European fashion retailer over the period 31 March to 16 June. Overall revenue reached $324K from 905 orders, with growth around 11.5% Week-over-Week.  Growth is primarily driven by increasing order volume rather than higher spending per transaction, as average order value remained relatively stable throughout the period.

Promotions do lead to short bursts of higher demand, but their overall impact on total revenue is relatively small, making up only about 6.8% of sales. The Mid-Season Clearance campaign reduced profitability due to deeper discounting during the promotion period. Product analysis shows that Pants and T-Shirts deliver the strongest profit margins while maintaining healthy revenue performance, whereas categories such as Sleepwear underperform despite promotional activity, indicating potential pricing or product strategy issues.

Customer behaviour analysis reveals that most customers purchase only once, while a small segment of repeat buyers generates significantly higher customer value.  Customers who place three or more orders generate up to six times more revenue than one-time buyers. This suggests that improving customer retention and encouraging repeat purchases could be an important opportunity for driving more stable, long-term growth.

**Overall, the analysis suggests that future growth should focus on increasing customer lifetime value, optimizing campaign strategy and expanding average order value through cross-selling and bundling initiatives. Strengthening customer retention while applying more targeted promotional strategies will be key to improving both revenue stability and long-term profitability.**

## 4. Sales Trends 

![Image](https://github.com/user-attachments/assets/f825d4f8-bf61-493a-87fc-be2d2e58959d)
 
**Revenue** has been rising steadily, mainly because more customers are making purchases, not because they’re spending more per order.

- The Mid-Season Clearance campaign in mid-May (12–19 May) produced the largest revenue spike, with weekly revenue exceeding $51K. This increase was accompanied by a sharp rise in order volume, indicating that the promotion successfully encouraged more purchases rather than higher spending per order.

- In contrast, revenue dropped significantly in early June (-58% week-over-week) despite the June Price Drop campaign, indicating that this promotion was less effective at boosting demand.

- Another decline of -62.7% week-over-week occurred in early May before the clearance campaign, likely reflecting normal fluctuations in demand rather than any promotional effect. This kind of short-term swing is common in smaller online stores, where a few fewer or extra orders can make percentage changes look much bigger than they really are.

**Profit** mirrored revenue, growing roughly 12% per week. Margins stayed steady for the most part, showing costs and pricing were well managed.

-	Margins remain stable around 43%, showing that pricing and cost management are consistent even during high-volume periods. During the mid-May clearance,margins dipped slightly because more discounted orders were sold.
-	Profit increases are largely volume-driven, with no significant changes in unit margins, confirming that profitability stems from selling more items rather than higher per-unit earnings.

**Order volume** follows the same pattern as revenue, confirming that sales growth is driven by volume.

-	Weekly order volumes increased by roughly 11–12%, with noticeable spikes during promotional periods that also correspond with higher revenue
-	Weeks where revenue dropped also show lower order numbers, reinforcing that performance is largely influenced by how many purchases are made rather than customers spending significantly more per order

**Average Order Value (AOV)** stayed mostly steady at about $358  with only minor week-to-week changes.

-	Peaks in revenue did not correspond with significant increases in AOV, indicating that promotions increase order frequency rather than basket size.
-	This stability suggests consistent purchasing behavior but also points to an opportunity to increase customer value through cross-selling, bundles, or checkout upsells, which could improve overall revenue without relying solely on more orders.

Revenue growth is primarily driven by higher transaction volume rather than increases in AOV, indicating that the business is successfully generating demand but has opportunities to increase per-order value.

## 5. Campaigns Performance

<img width="1260" height="592" alt="Image" src="https://github.com/user-attachments/assets/08857b9e-e423-4965-9249-161c2aa72cbd" />

Because campaigns in the dataset ran for very short durations, week-level uplift analysis wasn’t reliable. Instead, I focused on comparing promotional versus non-promotional performance using margins, order volume and sales contribution.

Promotional campaigns account for a small portion of total revenue (**6.8%**), with most sales happening during non-promotional periods. This shows that the business doesn’t rely heavily on discounts and full-price sales remain the main driver of revenue and profit.

Promotional campaigns tend to increase the number of orders rather than the size of each order. This is reflected in the slightly lower AOV during promotions compared with full-price sales, meaning promotions encourage more frequent purchases rather than higher spend per order.

-	Light promotions keep margins at a reasonable level, while deep-discount clearance events significantly cut into profits and should be used sparingly
-	Bigger discounts during clearance campaigns tend to attract new customers, while smaller, subtler price changes help keep existing customers engaged.

**Promotional campaigns contribute incremental revenue but significantly reduce profitability compared to non-promotional sales. While light promotions maintain acceptable margins, deep-discount clearance campaigns erode value and should be used selectively. The strongest financial performance is driven by full-price sales, indicating that demand is not heavily promotion-dependent.**

## 6. Products Performance 

<img width="1414" height="682" alt="Image" src="https://github.com/user-attachments/assets/22e9dd18-7fab-4a70-87c5-48e51fb8f722" />

This scatter plot examines how categories respond to promotional pricing, plotting average discount % against profit margin %. The goal is to understand which categories benefit from promotions, which do not, and where margins are being protected or eroded.

**Pants** stand out as the strongest performer. They achieve the highest margins while requiring relatively low discounts. This suggests strong inherent demand and low price sensitivity. 

**T-Shirts** also perform well, maintaining margins above the average while using slightly higher discounts. This indicates that modest promotions can drive volume without significantly damaging profitability. 

**Dresses** show stable profitability across both promotional and non-promotional periods. Despite requiring higher discounts to drive sales, their profit margin remains close to the average in both views. This indicates that promotions primarily influence volume rather than profitability. 

**Shoes** show slightly below-average margins despite moderate discounting. Sleepwear performs the weakest. It shows the lowest margins even with discounting. This suggests that promotions in this category fail to drive profitable demand and may actually be eroding value.

**T-Shirts anchor the business with both high sales and above-average margins, making them the primary engine of profitable growth.**

## 7.	Customer Retention, Value and Segmentation

<img width="1266" height="1129" alt="Image" src="https://github.com/user-attachments/assets/9b88fe72-051e-4a8d-a351-ed785fdf700d" />

The brand is still in early growth with 580 total customers and weekly growth of 7.4%, which is strong for a young fashion e-commerce business. 
However, growth volume alone does not equal sustainable value. When analysing customers, campaign performance and segmentation we can see that long-term value is being created by retained customers and not newly acquired ones. Overall retention sits at 24% which means that roughly 1 in 4 customers come back.

##### **April Growth Spike - 110 new customers – no active promotion**
  
This spike is interesting because there was no promotion running that week. The previous campaign (Spring Flash Sale) was on 6 April.
Possible explanations are delayed conversion from the Spring promotion ,customers taking time to decide or seasonal demand (Spring wardrobe refresh).
This suggests that promotions may not create immediate spikes only, they can generate a lag effect.

##### **May Growth Spike - Mid-Season Clearance (30% discount)**
  
Although the campaign brought in 74 new customers and reactivated 21 existing ones, average revenue per customer fell to $259 which is the lowest across campaigns. It also compressed profit margin to 21.15%. This indicates that purchasing behaviour during this period was highly price-sensitive. Customers were buying more units but spending less per transaction.
Clearance campaigns typically perform this way. They expand the customer base and generate transaction spikes, but they do not necessarily strengthen long-term customer value unless supported by strong post-purchase retention strategies.

##### **June Drop - June Price Drop Campaign (10% discount)**

The June Price Drop coincided with a noticeable increase in retention %. While part of this rise is due to the mix of customers who participated in the campaign, it also reflects genuine engagement from existing customers, who are responsible for most of the high-value purchases.

This campaign demonstrates that returning customers are actively monitoring the brand and respond strongly to targeted pricing. Unlike the May clearance, which focused on acquiring new customers, the June campaign was retention-driven, emphasizing the value of engaging the existing customer base. Although the scale was small, it provides clear evidence of the effectiveness of retention-focused strategies. Unlike the May clearance, this campaign wasn’t acquisition-heavy, it was retention-heavy.

#### Customer Value & Behavior
New customers are generally low-value, contributing modestly to revenue. Returning customers are almost entirely responsible for high-value transactions.

Campaign behavior:
-	Clearance campaigns boost volume and units sold (May campaign: 452 units), but average revenue per customer drops and profit margin compresses (May: $259 avg, 21.15% margin).
-	Targeted price drops (June) reinforce existing customer engagement without diluting margins.

## 8. Purchase Distribution

<img width="1198" height="647" alt="Image" src="https://github.com/user-attachments/assets/3f932bec-52f4-4718-9e6a-25130bc96bef" />

Customers with three or more purchases show dramatically higher average spend, reaching up to $2.7K for six or more purchases. This indicates that long-term revenue is concentrated among a relatively small segment of loyal customers, highlighting retention as a key driver of sustainable growth. 

-	Most new customers enter at low value.
-	High-value customers are almost entirely returning customers.

#### Why Customers Leave
Common factors may include:

- Price sensitivity: Low-value first purchases may not encourage repeat transactions.
-	Product relevance: Limited personalization or mismatches with customer preferences can reduce satisfaction.
-	Engagement gaps: Lack of post-purchase communication or incentives may fail to nurture repeat behavior.

#### Retention Strategies
To convert first-time buyers into repeat customers and strengthen long-term value the following approaches are recommended:

-	Implement loyalty programs to reward repeat purchases.
-	Send post-purchase emails to maintain engagement.
-	Offer personalized product recommendations based on purchase history.
-	Provide early access to new collections to create exclusivity.
-	Run targeted re-engagement campaigns to win back inactive customers.

**Strengthening engagement immediately after a first purchase is critical to improving retention and maximizing customer lifetime value.**

## 9.	Recommendations

**Focus on customer retention.**

Repeat customers generate much more revenue than one-time buyers. This suggests that relying only on new customer acquisition will not be enough for long-term growth. Increasing the number of customers who return for a second or third purchase should therefore be a key priority.

**Adjust promotion strategy.**\
Promotions do increase demand for short periods, but deeper discounts reduce profit margins. Instead of relying on heavy discounting, the company should focus on lighter and more targeted promotions that keep customers engaged without hurting profitability.

**Prioritize stronger product categories.**

Categories such as Pants and T-Shirts show strong margins and consistent demand, making them important contributors to overall profitability. On the other hand, categories like Sleepwear and Shoes perform weaker even when promotions are applied. These categories may require a review of pricing, product mix, or marketing strategy.

**Encourage repeat purchasing behaviour.**

Many customers buy only once. Creating incentives for them to return could significantly increase revenue. Loyalty programs, personalized recommendations, and post-purchase communication could help turn first-time buyers into repeat customers.

**Increase average order value.**

Revenue could also grow by increasing the value of each order. Cross-selling related products, offering bundles, or adding upsell options at checkout could encourage customers to add more items to their cart without relying on discounts.



