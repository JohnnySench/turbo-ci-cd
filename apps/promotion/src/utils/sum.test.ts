import { describe, it, expect } from 'vitest'
import { sum } from './sum'

describe('promotion fn sum', () => {
    it('adds numbers correctly', () => {
        expect(sum(2, 3)).toBe(5)
    })
})
