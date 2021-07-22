# 01-The-Cybersecurity-Mindset
## Table of Contents
   
* [Fundamentals](#fundamentals)
* [Intro to GRC](#intro-to-grc)
    * [Risk Management and Threat Modeling](#risk-management-and-threat-modeling)
        * [OWASP in Depth](#owasp-in-depth)
        * [Qualitative vs Quantitative Risk Analysis](#qualitative-vs-quantitative-risk-analysis)
        * [Mitigating Risk](#mitigating-risk)
        * [Cybersecurity Frameworks](#cybersecurity-frameworks)
* [Consumer vs Professional Environments](#consumer-vs-professional-environments)
* [Intro to Cyber Attacks](#intro-to-cyber-attacks)
* [Contingency Planning for Business Continuity and Disaster Recovery](#contingency-planning-for-business-continuity-and-disaster-recovery)
    * [Business Impact Analysis](#business-impact-analysis-bia)
        * [BIA Metrics](#bia-metrics)

## Fundamentals
* The CIA triad highlights the three cornerstones of information security: confidentiality, integrity, and availability.
    * **Confidentiality:** only the correct, authorized user/system/resource can view, access, change, or otherwise use data.
        * strong passwords
        * data encryption
        * MFA
    * **Integrity:** A system’s ability to ensure that the system and information is accurate and correct.
        * file permissions and user access controls
        * checksums
        * nonrepudiation measures
    * **Availability:** A system’s ability to ensure that systems, information, and services are available the vast majority of time.
        * redundancy
        * failover
        * RAID
        * data recovery and business continuity plan (BCP)
* Gaining the full picture.
    * To assess threats and mitigate risks, we need to check each component of an organization, and understand how malicious actors can exploit weaknesses within the organization and damage the stakeholders' finances, reputations, and well-being.
* Troubleshooting methodology.
    * While troubleshooting doesn’t sound quite as exciting as attacking and defending information systems, it is just as important a skill.
    * Whether you are a penetration tester, system administrator, SOC analyst, network admin, or IT help desk associate, you will most likely have to troubleshoot technology on a regular basis.
    * Remember that every time we have to research something it is an opportunity to expand our knowledge. Googling is a common task for IT professionals. It allows us to quickly reference, confirm, and discover information about tasks or issues that we are unfamiliar with.
    * The more you work through the problems you encounter during your daily activities and setups, the more robust knowledge you will have for solving any issue you encounter in the professional world. Hiring managers consider this problem-solving mentality a valuable quality. 

## Intro to GRC
* **Governance:** provides management frameworks used to implement security practices in the organization. It helps a business decide how to enforce its security practices by developing policies, standards, processes, and procedures.
* **Risk Management:** identifies which assets are most important and determine how they are most likely to be compromised. The business then uses this information to decide how to protect its most important and at-risk assets. This decision then informs the business's security practices.
* **Compliance:** ensures internal security policies are being followed and verifies that the business is following relevant security laws.

### Risk Management and Threat Modeling
* **Vulnerability:** The aspect of a business that can be exploited to compromise a system.
* **Threat:** An actor that might exploit a vulnerability. Threats can be intentional (a malicious hacker steals data), unintentional (an incompetent sysadmin destroys the network), or be due to a natural disaster.
* **Risk:** The possibility of losing something valuable. Equivalently, a risk will cost money if it occurs.
* **Risk Analysis:** The practice of understanding what risks an organization faces; which are most severe; and which are most likely.
* **Risk Management:** The practice of using the results of such an analysis to determine how to deploy personnel and spend budget.
    * Risk analysis is important because it quantifies how much a business needs to spend in the event of a given security break. Therefore, businesses can plan for setbacks before they occur.
* **Threat Modeling:** The practice of determining which attacks an organization is most likely to experience, who is most likely to launch them, and what can be done to stop them.
    * Threat modeling is an essential step to risk management because a risk is essential a price the business pays if the threat is realized. Therefore, they can prioritize the most expensive risks.
    * __Threat Modeling Methodologies:__
        * **PASTA:** Process for Attack Simulation and Threat Analysis. It aims to align consideration of business objectives with technical requirements.
        * **STRIDE:** Spoofing, Tampering, Repudiation, Information disclosure, DoS (Denial of Service), Elevation of Privilege. It focuses on identifying what can fail in the system being modeled.
        * **OWASP:** Open Web Application Security Project. It focuses on identifying possible threats, prioritizing risks, and planning mitigation strategies. It is mainly applied to the analysis of applications, such as web or desktop apps.
        > A bank might opt for PASTA, which gives greater consideration to the business being modeled, while a pentesting firm would probably opt to use STRIDE or OWASP. Students should know that they are likely to run into more than one of these during their professional careers.

#### OWASP In-Depth
The OWASP process consists of six steps:
1. __**Determine Assessment Scope:**__ Listing the assets under consideration, determining their value, and defining objectives for your threat modeling assessment.
    * **Asset value** is the monetary worth of a given asset. For assets like web applications, asset value should represent how much revenue and profit the asset generates.
    * **Exposure factor** measure "how much" of an asset will be affected in the event of a breach.
    * An **objective** is the metric that the business wants to achieve, such as reducing the incidence of DoS attacks against its servers.
    * **Asset Inventory:** The process of identifying and assigning an asset value (financial worth of an asset) to all of an organization's assets.
    * Scope is important because it tells risk analysts what they should focus on and what they can ignore. When an organization focuses on specific subset of their assets, they are adjusting their scope.
2. __**Identify Threat Agents:**__ A **threat agent** is a person or group that can actualize a threat, whether or not they are malicious.
    * Examples include:
        * APTs (Advanced Persistent Threats)
        * Script Kiddies
        * Insider Threats
3. __**Identify Possible Attacks:**__ Identify the attacks that each threat agent is likely to perform, based on how much skill and funding they have.
4. __**Identify Exploitable Vulnerabilities:**__ Identify ways for data to enter and exit the system.
    * For example, a web application takes information in from users and sends information back out in response to requests. Consider ways attackers might exploit these points of entry and exit
5. __**Rank/Prioritize Risks:**__ Rank which potential attacks are most severe and most likely to occur.
6. __**Mitigate Risks:**__ Determine ways to mitigate the most serious risks you identified.

#### Qualitative vs. Quantitative Risk Analysis
* **Qualitative Risk Analysis:** The process of prioritizing risk based on intangible factors.
* **Quantitative Risk Analysis:** The process of evaluating each risk based on its measured likelihood and impact.
    * **Likelihood** is the probability that the event will occur and impact is a measure of how bad it would be.
    * There is an additional metric, called *risk factor*, which is the number you get from multiplying likelihood by impact.
    * In order to perform quantitative Risk Analysis, analysts start by calculating how much it costs if an asset is breached. To calculate this, they first quantify asset value and exposure factor.
    * Exposure factor is always somewhat subjective. Analysts should start by estimating whether the occurrence of a risk would completely eliminate (1.0), mostly eliminate (0.75), half eliminate (0.5), partially eliminate (0.25), or not affect (0.0) an asset's ability to function.
* **Loss Expectancies:** A measure of how much money an organization will lose in the event of a given breach.
    * There are two common methods of measuring loss expectancy:
        * Single loss expectancy (SLE)
            * Analysts use exposure factor and asset value to calculate the number they're actually interested in: single loss expectancy (SLE).
            * It is calculated as: SLE = AV x EF, where SLE is single loss expectancy, AV is asset value, and EV is exposure factor.
            * SLE is the estimated cost each time the risk occurs. If it happens twice, the total cost would be twice the SLE.
        * Annual loss expectancy (ALE)
            * Annual rate of occurrence (ARO) as an estimate of how many times a risk is likely to occur in a given year.
                * ARO is calculated as follows: ARO = X / years, ARO is annual rate of occurrence, X occurrence(s), and years is per number of years.
            * ALE is the metric determining the cost of a risk re-occurring.
                * It is calculated as: ALE = ARO x SLE, where ALE is annual loss expectancy, ARO is annual rate of occurrence, and SLE is single loss expectancy.

#### Mitigating Risk
As information security professionals, it is important to understand the distinctions between laws, regulations, policies, guidelines, and frameworks. All of these will help guide your decision making process in everything you do.

* **Policies:** Explain that a policy is a set of ideas or plans that inform decision making within business, government, politics, or economics.
    * Examples:
        * Bring Your Own Device (BYOD) is a non-intrusive policy adopted by organizations that specifically defines the acceptable use of non-company owned devices. Devices referenced in this policy may include personally owned devices such as desktop computers, routers, switches, test measurement equipment, and weather equipment.
        * Mobile Device Management (MDM) is an example of a restrictive or intrusive policy that is a subset of a BYOD policy. MDM is an acceptable use policy related to personally owned mobile devices. Devices referenced in this policy include cell phones, laptops, and WiFi hotspots.
* **Guidelines:** Explain that a guideline is similar to a rule. Guidelines are issued by organizations to make the actions of its employees or departments more predictable and, presumably, higher quality.
    * Guidelines are not mandatory. They are suggestions meant to be followed by those to which they apply.
* **Laws:** Explain that laws are policies that are written in legal language, voted on, and passed by legislative bodies of government. 
    * Laws are enforced by agencies who are tasked with overseeing and monitoring the rules of law. Organizations including:
        * Security and Exchange Commission (SEC)
    * Since businesses in different industries manage different kinds of data, they must meet these obligations in different ways. This is why there are different laws for different industries. You should be aware of some of these, including:
        * **The Family Educational Rights and Privacy Act (FERPA)** protects the privacy of student educational records. Parents or eligible students have the right to request that records be corrected if they believe they are misleading and/or inaccurate.
        * **Gramm-Leach-Bliley Act (GLBA)** requires financial institutions who provide consumers financial products and services to provide an explanation of their information-sharing practices to safeguard sensitive data.
        * **Federal Information Security Management Act of 2002 (FISMA)** defines the framework for protecting government data, operations, and assets against natural or man-made threats.
        * **Health Insurance Portability and Accountability Act (HIPAA)** regulates the flow of healthcare information and defines how **personally identifiable information (PII)** must be protected from misuse and theft within the healthcare industry.
            * Any organization that collects, stores, administers, or provides PII is obligated to abide by HIPPA. This includes such organizations as health maintenance organizations (HMOs), dental offices, optometrist practices, and chiropractic offices.
* **Regulations:** Detailed instructions for how to enforce laws.

#### Cybersecurity Frameworks
* NIST Framework for Improving Critical Infrastructure Cybersecurity
    * Identify, Protect, Detect, Respond, Recover
    * Framework Implementation Tiers
        * Partial, Risk Informed, Repeatable, Adaptive
            * Risk Management Process
            * Integrated Risk Management Program
            * External Participation
* ISO/IEC 27001 - INFORMATION SECURITY MANAGEMENT[^2] 
* NIST Special Publication 800-37[^4] - Risk Management Framework for Information Systems and Organizations
    * Describes the formal RMF certification and accreditation process.
* NIST Special Publication 800-53 - Security and Privacy Controls for
Federal Information Systems
and Organizations
* NIST Special Publication 800-171 - Protecting Controlled Unclassified Information in Nonfederal Systems and Organizations[^3]
* GDPR
* CMMC
* PCI DSS Compliance
    * The Payment Card Industry Data Security Standards (PCI DSS) specify technical and operational requirements set by the PCI Security Standards Council (PCI SSC) to protect cardholder data. 
* SOC 2 Compliance
    * Five Trust Service Criteria (TSC) - Security, Availability, Processing Integrity, Confidentiality and Privacy.
* 23 NYCRR 500 Compliance
    * A regulation by the New York State Department of Financial Services that requires financial companies to implement a detailed framework to better protect consumer data privacy.
* SEC Compliance
    * he Office of Compliance Inspections and Examinations (OCIE) conducts the U.S. Securities and Exchange Commission’s (SEC) National Exam Program
* FINRA
* HIPAA
    * Maintain data for six years. Local and offsite backup

[^2]: https://www.iso.org/isoiec-27001-information-security.html
[^3]: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-171r2.pdf
[^4]: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf
## Consumer vs Professional Environments
**Personal computing:** traditionally, you're used to operating on your laptop or desktop. When you first purchase a PC it has a user friendly operating system (OS) installed. You'll use your PC for a variety of nondedicated tasks. For instance, it's everyday use could include things like navigating the internet, installing applications, and using peripherial devices, like webcams, to do video confrencing. Typically, these devices in an Enterprise environment are called **endpoints**. The normal user is refered to as an **end-user**.

**Servers:** Servers are often dedicated, meaning they only perform a limited amount of tasks at an extremely high level. Servers used specialized components that are designed to manage, store, send, and process data 24-hours a day.

When transitioning into IT you'll find that we don't care about the what the machine looks like we just care about what's in the case. The physical components (CPU, RAM, the SSD). As you progress it's a good idea to refer to the *bare metal* components as **Infrastructure**.

*   **Infrastructure:**
    * Computing
    * Storage
    * Networking

Datacenters are primarily comprised servers. Commonly the servers will have specialized OS's that allow for virtualization. Common brands seen are VMware and Hyper-V. A virtualization OS is specialized to be lightweight and designed to allow a single machine to divide up it's infrastructure resources among several guest OS's. As an example, a server that has 32 GB of RAM could run two Virtual Machines (VMs) at the same time with 16 GB of RAM each. We can use a single physical machine to run multiple virtual machines, effectively turning one computer into many. A server that performs OS-level virtualization is referred to as a Type-1 hypervisor or a "bare-metal" hypervisor.
> Note: A Type-2 hypervisor is an application that is installed on an OS. Common brands include VirtualBox, VMware Workstation, Hyper-V (I know..that'll be confusing for a while.)

* Virtual machines have many advantages over physical machines:
    * They are easy and inexpensive (often free) to set up and run.

## Intro to Cyber Attacks
| User Attacks | Web Attacts | Server Attacks | Database Attacks |
| :--- | :----: | :----: | ---: |
| Social Engineering | Brute-Force Attacks | OS Exploits | Default Credentials |
| Phishing Attacks   | Code Injection | Malicious Software | Unpatched Database |
| Credential Reuse | Faulty Sessions| | Lack of Segregation |
| Malware Attacks | | |
| Man in the Middle | | |
| Packet Sniffing | | |
| Computer Theft | | |

## Contingency Planning for Business Continuity and Disaster Recovery
Business continuity planning (BCP) and disaster recovery (DR) planning produce contingency plans in case of a disruption or disaster, and ensure that the business can get back on its feet and remain operational.

* BCP focuses on processes and procedures that an organization needs to consider in order to ensure that critical functions continue both during and after a disaster.
* DR is more focused on the specific steps that a organization needs to take to resume work after a disaster. It is concerned more with the technology and information infrastructure and related complexities.

**Contingency Planning:** Contingency planning considerations and strategies address the impact level of the availability security objective of information systems.

### Business Impact Analysis (BIA)
* Identify key processes and functions of the business.
* Establish a detailed list of requirements for business recovery.
* Determine what the resource interdependencies are.
* Determine the impact on daily operations.
* Develop priorities and classification of business processes and functions.
* Develop recovery time requirements.
* Determine financial, operational, and legal impacts of disruption.

#### BIA Metrics:
* **Recovery Point Objective (RPO):** The amount of data that a mission/business process data can afford to lose (taking into account the most recent backup of the data) following a disruption or system outage.
* **Maximum Tolerable Downtime (MTD):** The total amount of downtime that a system can be unavailable to users and the business. Within the time span of MTD, there are two other metrics:
    * **Recovery Time Objective (RTO):** The maximum tolerable amount of time needed to bring all critical systems back online after a disaster.
    * **Work Recovery Time (WRT):** The remaining time from the MTD after RTO. For example, if the MTD is four days and the RTO is one day, the WRT needed to get everything up and running again is three days.
* **Alternate Sites:**
    * A hot site is one that is ready to go and running at all time, and and can immediately continue operations.
    * A cold site is a space with very little set up.
    * A warm site is in-between.

