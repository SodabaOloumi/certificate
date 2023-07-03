# Certificate
In order to address the issue of fake certificates, an application has been developed with two types of users: organization users and student users. The primary purpose of this application is to allow organizations to create certificates for students, ensuring their authenticity through a unique hashed ID. By implementing this system, the prevalence of fake certificates in Afghanistan can be significantly reduced.

The organization user plays a crucial role in this application as they are responsible for creating certificates for students. These organization users are typically educational institutions, training centers, or any other authorized entities that have the authority to issue certificates. When creating a certificate, the organization user generates a unique hashed ID for each student. This ID serves as a digital fingerprint that ensures the authenticity and integrity of the certificate.

Once the certificate is created by the organization user, it becomes accessible to the respective student user. 

By implementing this system, several benefits are achieved. Firstly, it provides a secure and tamper-proof method of issuing certificates. The unique hashed ID acts as a digital seal that cannot be replicated or altered without detection. This significantly reduces the chances of fake certificates being produced.

Secondly, it simplifies the process for students to access and verify their certificates. Instead of relying on physical copies or contacting issuing authorities for verification, students can conveniently log into the application and view their certificates at any time.

Furthermore, this system also aids in maintaining accurate records of issued certificates. The application keeps track of all created certificates along with relevant details such as issuance date, course completion information, and more. This centralized database ensures transparency and facilitates easy verification by potential employers or educational institutions.

In conclusion, the development of an application with two types of users - organization users and student users - provides an effective solution to combat fake certificates in Afghanistan. By utilizing unique hashed IDs, the authenticity and integrity of certificates are ensured. This system not only prevents the creation of fake certificates but also simplifies the verification process for students and maintains accurate records.

##  Contract Workflow
1: organization and student  will have to register themselves on the contract.

2: organization can add cetificate in contract .

3: students can access theirs own certificate with  id.

4: ID certificate is created exclusively in hashed form at the time of registration of the certificate.


## How to run this project locally:

### Prerequisites
- Node.js >= v14
- Truffle and Ganache
- npm
### Contracts
- Clone code 
 ``
git clone https://github.com/SodabaOloumi/certificate.git
``
- Run `npm install` in root to install Truffle build and smart contract dependencies
- Run local testnet in port `7545` with an Ethereum client, e.g. Ganache
- `truffle migrate --network development `
- In truffle-config.js file , Fill in the following below.
  - MNEMONIC=" your mnemonic here in quotes"
  - INFURA_URL=insert your infura url
  - `truffle migrate --network ropsten `



### Frontend
- `cd app`
- `npm install`
- `npm run serve`
- Open `http://localhost:8080` 

## structure
- `app`: Project's Vue frontend.
- `back`: Project's back end codes.
   - `contracts`:  Certification.sol  is the main contract. methods.
   - `build`: When compile the contract this folder created , its save **data/abi** .
   - `migrations`: Migration files for deploying contracts in `contracts` directory.



