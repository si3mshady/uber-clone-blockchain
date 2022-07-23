// First, we must import the schema creator
import createSchema from 'part:@sanity/base/schema-creator'

import schemaTypes from 'all:part:@sanity/base/schema-type'

import {userSchema} from './userSchema'
import { ridesSchema } from './rideSchema'
import { tripSchema } from './tripSchema'

export default createSchema({

  name: 'default',
  
  types: schemaTypes.concat([
    userSchema, ridesSchema, tripSchema
   
  ]),
})


// #sanity start
// sanity deploy 