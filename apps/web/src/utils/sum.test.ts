import { describe, it, expect } from 'vitest'
import { sum } from './sum'

describe('web fn sum', () => {
    it('adds numbers correctly', () => {
        expect(sum(2, 3)).toBe(5)
    })
})
