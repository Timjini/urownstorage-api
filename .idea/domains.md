## Core Domain 

#### StorageSpace
attributes: 
- Id
- price
- height
- width 
- length
- type[Dynamic]
- availability (based on calendar)
- features
- coordinates (lat, lng)
- Address 
===> Functions of the Model|
- calculate the cubic feet/meter
- 

####  StorageSpaceTypes
- id 
- name (backyard, yard, room, garage, driveway, parking spot, officeSpace, warehouse)
- description
- Features[]
- 

#### StorageSpaceFeatures
- id
- accessibility (freely accessible, only when owner is available)
- airconditioned(boolean) (optional)
- climate Controlled (heat, cold...)
- fenced(boolean)
- gated
- security/cameras 
- power availability (electricity, water, internet...)
- paved(boolean)

#### Address
- id 
- address1
- address2
- city
- state
- zip
- country

#### User Profile


#### Booking