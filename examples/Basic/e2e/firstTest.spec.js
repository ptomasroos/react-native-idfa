describe('Example', () => {
  beforeEach(async () => {
    await device.reloadReactNative();
  });

  it('should have non empty rendered advertiser identifier', async () => {
    await expect(element(by.id('idfa'))).toBeVisible();
  });
});
