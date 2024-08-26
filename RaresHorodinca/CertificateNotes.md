# Certificate Notes

## Traditional Certifcate Management

- Create a Certificate Signing request ( CSR )  
- Submit the CSR to a trusted certificate authority  
- prove ownership of example.org  
- obtain the signed certificate from the ca  
- update the server configuration to make use of the signed certificate  
- Repeat the whole process before the signed certificate expires  

Diadvantages :  
- time consuming  
- compex  
- easy to forget to renew  

## Acme Protocol  

- developed and used by Lets Encrypt  
- Has two key parts :
  - ACME client
  - ACME server  

### How does it work 

- the acme client generates a key pair, creates an account eith acme server , private key used to validate the requests 

- after the ace client has succesfully proved ownership of the domain name it:
  - genrates a key pair 
  - generates a CSR using a key pair 
  - Sends the CSR to the ACME server 
  - The whole CSR is signed in using the account private key  

Advantages :

- entire certificate mangemnet can be fully automated  

### Acme server implementations 

- Lets Encrypt  
- Buypass Go  

### Acme Client Implementations

- Goal is to have ACME Clients integrated directly into web servers  
  






