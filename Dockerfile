FROM node:16-bullseye as node_modules

WORKDIR /app

COPY package.json package.json
RUN yarn install


FROM node:16-bullseye as builder
WORKDIR /app

COPY --from=node_modules /app/node_modules ./node_modules
COPY package.json package.json
COPY assets  ./assets
COPY images ./images
COPY components ./components
COPY pages ./pages
COPY context ./context
COPY public ./public
COPY studio ./studio
COPY styles ./styles
COPY tailwind.config.js ./tailwind.config.js 
COPY postcss.config.js ./postcss.config.js
COPY next.config.js ./next.config.js

ARG SANITY_TOKEN=skKbKoJXIPPag0MX0VW1As3XnSX12tXEknhT4tuqKznBo9ldznTyAhlkl773tdyPqBNjXBh1jbB7XHbiZt6esjw0IRptM2ASsArBwSHBra5STAdxuy27IWYTM8Itiw3ZMHHCV5keTxVDoJCpphOuCpL9dfiGlcEmPVllpxjHSRu4yRKuafng
ARG SANITY_PROJECT_ID=9ktmfl6s
ARG MAPBOX_PLACES_DURATION_URL=https://api.mapbox.com/directions/v5/mapbox/driving
ARG MAPBOX_PLACES_API_URL=https://api.mapbox.com/geocoding/v5/mapbox.places
ARG MAPBOX_API_TOKEN=pk.eyJ1IjoiZWxnZW5lc2lzYmxvY2siLCJhIjoiY2w1djVpOWxpMDJidTNscnQ0bHhxaDk2bCJ9.jsa850TKoWTXxuPKBxaF9A


ENV NEXT_PUBLIC_SANITY_TOKEN=${SANITY_TOKEN}
ENV NEXT_PUBLIC_SANITY_PROJECT_ID=${SANITY_PROJECT_ID}
ENV NEXT_PUBLIC_MAPBOX_PLACES_DURATION_URL=${MAPBOX_PLACES_DURATION_URL}
ENV NEXT_PUBLIC_MAPBOX_PLACES_API_URL=${MAPBOX_PLACES_API_URL}
ENV NEXT_PUBLIC_MAPBOX_API_TOKEN=${MAPBOX_API_TOKEN}


# ENV NEXT_PUBLIC_SERVER_URL=ec2-35-91-126-195.us-west-2.compute.amazonaws.com:3000
# http://35.90.145.226:3000

EXPOSE 3000
EXPOSE 3001

CMD [ "yarn", "dev" ]


