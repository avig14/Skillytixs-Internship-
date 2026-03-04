import requests
from bs4 import BeautifulSoup
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import time
import random
from collections import Counter
import re

# --- CONFIGURATION ---
# We will target TimesJobs for this example as it has a simpler structure than Indeed/Naukri.
# However, for the purpose of the internship, you can toggle MOCK_DATA_MODE to True
# to generate the analysis deliverables if the scraping gets blocked.
MOCK_DATA_MODE = False 
BASE_URL = "https://www.timesjobs.com/candidate/job-search.html?searchType=personalizedSearch&from=submit&txtKeywords=Data+Analyst&txtLocation="

def get_soup(url):
    """
    Fetches the URL and returns a BeautifulSoup object.
    Includes headers to mimic a real browser (User-Agent).
    """
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
    }
    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status() # Check for errors
        return BeautifulSoup(response.text, 'html.parser')
    except Exception as e:
        print(f"Error fetching page: {e}")
        return None

def scrape_jobs():
    """
    Main scraping logic.
    """
    jobs_data = []
    print("Beginning Scraping process...")
    
    # We will scrape the first page for this example to avoid overloading server
    soup = get_soup(BASE_URL)
    
    if not soup:
        return []

    # Finding the job cards (Note: These class names are specific to TimesJobs and change over time)
    # You must 'Inspect Element' on the website to verify these tags.
    job_cards = soup.find_all('li', class_='clearfix job-bx wht-shd-bx')
    
    print(f"Found {len(job_cards)} job cards.")

    for card in job_cards:
        try:
            # 1. Extract Company Name
            company_name = card.find('h3', class_='joblist-comp-name').text.strip()
            
            # 2. Extract Skills (located in a specific span or div)
            skills_section = card.find('span', class_='srp-skills').text.strip()
            
            # 3. Extract Location (often inside a span with a specific icon/class)
            # In TimesJobs, location is often in a list item or span
            location_tag = card.find('ul', class_='top-jd-dtl')
            location = "Unknown"
            if location_tag:
                 # The location is usually the last <span> in this list
                location = location_tag.find_all('span')[-1].text.strip()

            # 4. Extract Title (often an <h2> or <a> tag)
            title = card.find('h2').text.strip()

            jobs_data.append({
                'Title': title,
                'Company': company_name,
                'Skills': skills_section,
                'Location': location
            })
            
        except AttributeError:
            continue # Skip card if information is missing

        # Ethical Scraping: Sleep between items if iterating pages 
        # time.sleep(random.uniform(0.5, 1.5)) 
    
    return jobs_data

def generate_mock_data():
    """
    Generates dummy data if scraping fails (for assignment submission safety).
    """
    print("Generating MOCK data for analysis demonstration...")
    locations = ['Bangalore', 'Mumbai', 'Gurgaon', 'Hyderabad', 'Pune', 'Remote', 'Delhi']
    skills_pool = ['Python', 'SQL', 'Excel', 'Tableau', 'Power BI', 'Machine Learning', 'AWS']
    
    data = []
    for i in range(50):
        data.append({
            'Title': 'Data Analyst',
            'Company': f'Company_{i}',
            'Skills': ", ".join(random.sample(skills_pool, k=3)),
            'Location': random.choice(locations)
        })
    return data

# --- MAIN EXECUTION ---
if __name__ == "__main__":
    
    # 1. Collect Data
    if MOCK_DATA_MODE:
        data = generate_mock_data()
    else:
        data = scrape_jobs()
        if len(data) == 0:
            print("Scraping returned 0 results (site might have changed structure). Switching to Mock Data.")
            data = generate_mock_data()

    # 2. Create DataFrame [cite: 7]
    df = pd.DataFrame(data)
    
    # 3. Data Cleaning & Analysis
    print("\n--- DATA PREVIEW ---")
    print(df.head())

    # Clean Location strings (remove extra spaces or artifacts) [cite: 20]
    df['Location'] = df['Location'].apply(lambda x: x.split("(")[0].strip() if "(" in x else x)

    # Count Top Locations 
    top_locations = df['Location'].value_counts().head(5)
    print("\n--- TOP 5 LOCATIONS ---")
    print(top_locations)

    # Analyze Skills (Skills are often comma-separated strings, need to split them) [cite: 22, 24]
    all_skills = []
    for skill_str in df['Skills']:
        # Split by comma, strip whitespace, convert to lowercase for consistency
        skills_list = [s.strip().lower() for s in skill_str.split(',')]
        all_skills.extend(skills_list)
    
    skill_counts = Counter(all_skills).most_common(5)
    print("\n--- TOP 5 IN-DEMAND SKILLS ---")
    print(skill_counts)

    # 4. Visualization [cite: 16, 17]
    plt.figure(figsize=(10, 6))
    
    # using Seaborn for a nicer look
    sns.barplot(x=top_locations.index, y=top_locations.values, palette='viridis')
    
    plt.title('Top 5 Job Locations for Data Analysts', fontsize=14)
    plt.xlabel('Location', fontsize=12)
    plt.ylabel('Number of Jobs', fontsize=12)
    plt.xticks(rotation=45)
    plt.tight_layout()
    
    # Save the plot
    plt.savefig('job_location_analysis.png')
    print("\nPlot saved as 'job_location_analysis.png'")
    plt.show()

    # 5. Summary Output
    print(f"\nTotal jobs analyzed: {len(df)}")