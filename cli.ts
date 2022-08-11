#!/usr/bin/env ts-node

import yargs from 'yargs'
import { hideBin } from 'yargs/helpers'

Error.stackTraceLimit = Infinity

const parser = yargs(hideBin(process.argv))
  .option('verbose', {
    alias: 'v',
    type: 'boolean',
    default: false,
    description: 'Run with verbose logging',
  })
  .strict()
  .help()
  // .fail(false)

const main = async () => await parser.argv

main()
  .catch(e => {
    console.error(e)
    process.exit(1)
  })
