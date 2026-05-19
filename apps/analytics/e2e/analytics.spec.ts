import { test, expect } from '@playwright/test'

test('analytics app loads homepage', async ({ page }) => {
    await page.goto('/')
    await page.waitForLoadState('domcontentloaded')

    await expect(page).toHaveTitle(/analytics/)
})
